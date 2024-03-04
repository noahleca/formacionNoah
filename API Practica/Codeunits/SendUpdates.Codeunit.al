codeunit 50100 "Send Updates"
{
    local procedure CreateJSON(User: Record User)
    var 
        CustObject: JsonObject;
        JsonObject: JsonObject;
        JsonText: Text;
    begin
        Clear(JsonObject);
        Clear(CustObject);

        CustObject.Add('User Security ID', User."User Security ID");
        CustObject.Add('User Name', User."User Name");
        CustObject.Add('Full Name', User."Full Name");
        CustObject.Add('State', User.State);
        CustObject.Add('Windows Security ID', User."Windows Security ID");
        CustObject.Add('License Type', User."License Type");
        CustObject.Add('Authentication Email', User."Authentication Email");

        JsonObject.Add('CustObject', CustObject);
        JsonObject.WriteTo(JsonText);
    end;
    procedure GetUser(UserSecurityID: Text): Text;
    var
        User: Record User;
        JObject: JsonObject;
        JsonText: Text;
    begin
        if not User.Get(UserSecurityID) then
            Error('User not found');
        JObject.Add('User Security ID', User."User Security ID");
        JObject.Add('User Name', User."User Name");
        JObject.Add('Full Name', User."Full Name");
        JObject.Add('State', User.State);
        JObject.Add('Windows Security ID', User."Windows Security ID");
        JObject.Add('License Type', User."License Type");
        JObject.Add('Authentication Email', User."Authentication Email");
        if not JObject.WriteTo(JsonText) then
            Error('Error while converting to JSON');
        exit(JsonText);
    end;

    procedure CreateJSONUser(User: Record User; URL: Text; RequestType: Text; jsonText: Text) ReturnValue: Text
    var
        HttpClient: HttpClient;
        HttpHeaders: HttpHeaders;
        HttpContent: HttpContent;
        ContentHttpHeaders: HttpHeaders;
        HttpResponseMessage: HttpResponseMessage;
        HttpRequestMessage: HttpRequestMessage;
        HeaderJsonObject: JsonObject;
        ResultLbl: Label 'Result: ', Comment = 'ESP="Result: "';
    begin
        HttpHeaders := HttpClient.DefaultRequestHeaders();
        case RequestType of
            'Get':
                begin
                    HttpClient.Get(URL, HttpResponseMessage);
                end;
            'Put':
                begin
                    HeaderJsonObject.Add('User Security ID', User."User Security ID");
                    HeaderJsonObject.Add('User Name', User."User Name");
                    HeaderJsonObject.Add('Full Name', User."Full Name");
                    HeaderJsonObject.Add('State', User.State);
                    HeaderJsonObject.Add('Windows Security ID', User."Windows Security ID");
                    HeaderJsonObject.Add('License Type', User."License Type");
                    HeaderJsonObject.Add('Authentication Email', User."Authentication Email");

                    if HttpClient.Put(URL, HttpContent, HttpResponseMessage) then begin
                        HeaderJsonObject.WriteTo(jsonText);
                        HttpHeaders.Add('If-Match', '*');
                        HttpContent.WriteFrom(jsonText);
                        HttpContent.GetHeaders(ContentHttpHeaders);
                        ContentHttpHeaders.Clear();
                        ContentHttpHeaders.Add('Content-Type', 'application/json');
                        HttpClient.Put(URL, HttpContent, HttpResponseMessage);
                        Message('OK');
                    end else
                        Message('Error');
                end;
            'Patch':
                begin
                    Clear(HttpClient);
                    Clear(HttpHeaders);
                    Clear(HttpContent);
                    Clear(ContentHttpHeaders);
                    Clear(HttpResponseMessage);
                    Clear(HttpRequestMessage);

                    if HttpClient.Send(HttpRequestMessage, HttpResponseMessage) then begin
                        HeaderJsonObject.WriteTo(jsonText);
                        HttpContent.WriteFrom(jsonText);
                        HttpContent.GetHeaders(ContentHttpHeaders);

                        ContentHttpHeaders.Clear();
                        ContentHttpHeaders.Add('Content-Type', 'application/json');

                        HttpRequestMessage.GetHeaders(HttpHeaders);

                        HttpRequestMessage.Content(HttpContent);
                        HttpRequestMessage.SetRequestUri(URL);
                        HttpRequestMessage.Method('PATCH');

                        HttpClient.Send(HttpRequestMessage, HttpResponseMessage);
                    end;
                end;
            'Post':
                begin
                    HeaderJsonObject.Add('User Security ID', User."User Security ID");
                    HeaderJsonObject.Add('User Name', User."User Name");
                    HeaderJsonObject.Add('Full Name', User."Full Name");
                    HeaderJsonObject.Add('State', User.State);
                    HeaderJsonObject.Add('Windows Security ID', User."Windows Security ID");
                    HeaderJsonObject.Add('License Type', User."License Type");
                    HeaderJsonObject.Add('Authentication Email', User."Authentication Email");

                    if HttpClient.Post(URL, HttpContent, HttpResponseMessage) then begin
                        HeaderJsonObject.WriteTo(jsonText);
                        HttpContent.WriteFrom(jsonText);
                        HttpContent.GetHeaders(HttpHeaders);
                        HttpHeaders.Clear();
                        HttpHeaders.Add('Content-Type', 'application/json');
                        HttpClient.Post(URL, HttpContent, HttpResponseMessage);
                        Message('OK');
                    end else
                        Message('Error');
                end;
            'Delete':
                begin
                    HttpClient.Delete(URL, HttpResponseMessage);
                    if HttpResponseMessage.IsSuccessStatusCode then
                        exit(ResultLbl + Format(HttpResponseMessage.IsSuccessStatusCode));
                end;
            'Function':
                begin
                    HttpClient.Post(URL, HttpContent, HttpResponseMessage);
                    if HttpResponseMessage.IsSuccessStatusCode then
                    exit(ResultLbl + Format(HttpResponseMessage.IsSuccessStatusCode));
                end;
        end;
        HttpResponseMessage.Content.ReadAs(ReturnValue);
    end;
}