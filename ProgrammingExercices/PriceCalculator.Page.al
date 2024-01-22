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
                    Editable = false;
                }
                field(TotalCredits; TotalCredits)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(TotalSales; TotalSales)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(GrandTotal; GrandTotal)
                {
                    ApplicationArea = All;
                    Editable = false;
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
                Image = Calculate;

                trigger OnAction()
                begin
                    if Quantity > 0 then exit;
                    Result := Quantity * Price;
                    if Result < 0 then
                        TotalCredits += Result
                    else
                        TotalSales += Result;
                    GrandTotal += Result;
                end;
            }
            action(Clear)
            {
                ApplicationArea = All;
                Caption = 'Clear';
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ClearAll();
                end;
            }
        }
    }
    var
        Quantity, Price, Result, TotalCredits, TotalSales, GrandTotal : decimal;
}