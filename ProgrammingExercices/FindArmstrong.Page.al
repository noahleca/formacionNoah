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
                    for i := 20 to 22 do begin
                        temp := CopyStr(format(i), 1);
                        power := RIGHT(temp, 1);
                        //ok := Evaluate(i, temp.TrimStart());
                    end;
                    Message("power");
                    //Get the Power from the loopNumber
                    //Loop over every digit of the loopNumber
                    //Get the digit
                    //Calculate it's Power
                    //Add the power to the temp result
                    //Compare the temp with the original number, and if the same then remember
                    //Message the result
                end;
            }
        }
    }
    var
        temp, power : text;
        i: integer;
        ok: Boolean;
}