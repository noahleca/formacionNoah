table 50102 "Configuracion Table"
{
    Caption = 'Configuracion Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            DataClassification = CustomerContent;
        }
        field(2; "API REST Base URL"; Text[100])
        {
            Caption = 'API REST Base URL';
            DataClassification = CustomerContent;
        }
    }
    procedure InsertConfiguracion(URL: Text[100])
    var
        Configuracion: Record "Configuracion Table";
    begin
        Clear(Configuracion);
        Configuracion."API REST Base URL" := URL;
        Configuracion.Insert();
    end;
}