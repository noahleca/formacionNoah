codeunit 50115 UserMonitoring
{
    trigger OnAfterInsert()
    begin
        // Captura el registro insertado en la tabla User
        // y lo envía a la API en localhost:3000
        SendUserData(GetRecord(User));
    end;

    procedure SendUserData(User: Record "User")
    var
        HttpClient: HttpClient;
        RequestMessage: HttpRequestMessage;
        ResponseMessage: HttpResponseMessage;
        JsonContent: JsonObject;
    begin
        // Inicializar el cliente HTTP
        HttpClient.Get('http://localhost:3000', RequestMessage);
        
        // Construir el objeto JSON con los datos del usuario
        JsonContent.Add('UserID', User."ID");
        JsonContent.Add('UserName', User."Name");
        JsonContent.Add('UserEmail', User."Email");
        
        // Crear una solicitud HTTP POST con el cuerpo JSON
        RequestMessage.SetContentFromJson(JsonContent);
        RequestMessage.SetMethod('POST');
        
        // Enviar la solicitud HTTP
        HttpClient.Send(RequestMessage, ResponseMessage);
        
        // Verificar si la solicitud fue exitosa
        if ResponseMessage.IsSuccessStatusCode() then
            Message('Datos del usuario enviados exitosamente.');
        else
            Error('Error al enviar los datos del usuario: %1', ResponseMessage.ReasonPhrase);
        
        // Cerrar la conexión HTTP
        HttpClient.Close();
    end;
}
