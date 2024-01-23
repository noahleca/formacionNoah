page 55102 "Get the numbers"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Get the numbers';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(textEntrada; textEntrada)
                {
                    ApplicationArea = All;
                    Caption = 'Input';
                    ToolTip = 'Input';
                }
            }
            group(Output)
            {
                field(textSalida; textSalida)
                {
                    ApplicationArea = All;
                    Caption = 'Output';
                    ToolTip = 'Output';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Get the numbers';
                ToolTip = 'Get the numbers';
                Promoted = true;
                PromotedIsBig = true;
                Image = Action;

                trigger OnAction()
                begin
                    Clear(textSalida);
                    for longitud := 1 to StrLen(textEntrada) do begin
                        temp := CopyStr(textEntrada, longitud, 1);
                        if temp in ['0' .. '9'] then
                            textSalida += temp;
                    end;
                    textSalida := textSalida;
                end;
            }
        }
    }

    var
        textEntrada, textSalida, temp : text;
        longitud: integer;
}