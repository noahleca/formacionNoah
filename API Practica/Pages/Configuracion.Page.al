page 50102 "Configuracion Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Configuracion Table";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("API REST Base URL"; Rec."API REST Base URL")
                {
                    ToolTip = 'Specifies the API REST Base URL of the record.';
                    Caption = 'API REST Base URL.';
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(InsertDefaultBaseURL)
            {
                ApplicationArea = All;
                ToolTip = 'Insert the default base URL of the API.';
                Image = Add;
                trigger OnAction();
                var
                    Configuracion: Record "Configuracion Table";
                    ConfiguracionNotEmptyErr: Label 'There are already Configuraciones in the table.';
                begin
                    if Configuracion.IsEmpty then begin
                        Configuracion.InsertConfiguracion('http://localhost:3000');
                    end
                    else
                        Error(ConfiguracionNotEmptyErr);
                end;
            }
        }
    }
}