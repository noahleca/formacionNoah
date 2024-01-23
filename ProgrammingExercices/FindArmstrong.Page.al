page 55103 "Armstrong Numbers"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {

        }
    }
    actions
    {
        area(Processing)
        {
            action(GetNumbers)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    recuentoArmstrong := 0;
                    //Loop from 1 to 10000
                    for i := 1 to 10000 do begin
                        //Get the Power from the loopNumber
                        numeroActual := Format(i);
                        longitudNumero := StrLen(numeroActual);
                        potencia := 0;
                        //Loop over every digit of the loopNumber
                        for j := 1 to longitudNumero do begin
                            //Get the digits
                            texto := CopyStr(numeroActual, j, 1);
                            Evaluate(digito, texto);
                            potenciaTemp := Power(digito, longitudNumero);
                            potencia := potencia + potenciaTemp;
                        end;
                        if potencia = i then begin
                            recuentoArmstrong += 1;
                        end
                    end;
                    Message('Numeros Armstrong totales: %1', recuentoArmstrong);
                end;
            }
        }
    }
    var
        numeroActual, texto : Text;
        i, j, longitudNumero, digito, potenciaTemp, recuentoArmstrong : Integer;
        potencia: Decimal;
        Number: Record "Armstrong Number";
}

table 55104 "Armstrong Number"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; Number; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
}