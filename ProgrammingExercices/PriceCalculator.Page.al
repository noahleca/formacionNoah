page 55101 "Price Calculator"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Price Calculator';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
                field(Price; Price)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                field(Result; Result)
                {
                    ApplicationArea = All;
                }
                field(TotalCredits; TotalCredits)
                {
                    ApplicationArea = All;
                }
                field(TotalSales; TotalSales)
                {
                    ApplicationArea = All;
                }
                field(GrandTotal; GrandTotal)
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
                Caption = 'Execute';
                Image = ListPage;

                trigger OnAction()
                begin
                    if Quantity = 0 then
                        Result := Quantity * Price;
                    GrandTotal := GrandTotal + Result;
                    if Result < 0 then
                        TotalCredits := TotalCredits + Result
                    else
                        TotalSales := TotalSales + Result;
                end;
            }
        }
    }

    var
        Quantity, Price, Result, TotalCredits, TotalSales, GrandTotal : decimal;
}