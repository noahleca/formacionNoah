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

                    //Loop from 1 to 10000
                    for i := 153 to 154 do begin
                        //Get the Power from the loopNumber
                        numeroActual := Format(i);
                        longitudNumero := StrLen(numeroActual);
                        stringPotencia := CopyStr(numeroActual, longitudNumero, 1);
                        Evaluate(potencia, stringPotencia);
                        //Loop over every digit of the loopNumber
                        for j := 1 to longitudNumero do begin
                            //Get the digits
                            texto := CopyStr(numeroActual, j, 1);
                            Evaluate(digito, texto);
                            potenciaTemp := Power(digito, potencia);
                            Message('dígito para j=%1: %2', j, potenciaTemp);
                        end;
                    end;
                    //Message('Último dígito para i=%1: %2', i, stringPotencia);



                    //Calculate it's Power
                    //Add the power to the temp result
                    //Compare the temp with the original number, and if the same then remember
                    //Message the result
                end;
            }
        }
    }
    var
        numeroActual, stringPotencia, texto : text;
        i, j, longitudNumero, digito, potenciaTemp : integer;
        potencia: decimal;
        // --
        temp: text;
}