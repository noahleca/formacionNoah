codeunit 50110 "Send Updates"
{
    [EventSubscriber(ObjectType::Table, Database::"User MGS Table", 'OnAfterModifyEvent', '', false, false)]
    local procedure MyProcedure()
    begin

    end;

    procedure CreateJSONUser(User: Record "User MGS Table"; URL: Text; RequestType: Text; jsonText: Text) ReturnValue: Text
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
                    HeaderJsonObject.Add('User Security ID', User."No.");
                    HeaderJsonObject.Add('User Name', User.Name);
                    HeaderJsonObject.Add('Full Name', User.Email);
                    HeaderJsonObject.Add('State', User."External Id");

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
                    HeaderJsonObject.Add('User Security ID', User."No.");
                    HeaderJsonObject.Add('User Name', User.Name);
                    HeaderJsonObject.Add('Full Name', User.Email);
                    HeaderJsonObject.Add('State', User."External Id");

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