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
                field(textEntrada; textEntrada)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                field(textSalida; textSalida)
                {
                    ApplicationArea = All;
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

                trigger OnAction()
                begin
                    length := StrLen(textEntrada);
                    for curr := 1 to length do
                        ;
                end;
            }
        }
    }

    var
        textEntrada, textSalida, numeros : text;
        length, curr : integer;
}