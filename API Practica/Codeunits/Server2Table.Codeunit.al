codeunit 50102 "JSON Server to Table"
{
    procedure HttpRequest()
    var
        HC: HttpClient;
        HRC: HttpResponseMessage;
        URL: Label 'http://192.168.87.56:3000/user';
        R: Text;
        JO: JsonObject;
        Tools: Codeunit "JSON Tools";
    begin
        if HC.Get(URL, HRC) then begin
            HRC.Content.ReadAs(R);
            JO.ReadFrom(R);
            //Tools.Json2Rec(JO, 50100);
            Message('Response: %1', R);
        end else
            Message('Error al conectar a la API');
    end;


}