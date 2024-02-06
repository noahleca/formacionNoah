page 50055 "Show Won/Lost Quotes"
{
    PageType = ListPart;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const(Quote));
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Rep)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the no. of this quote.';
                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Sales Quote", Rec);
                    end;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name linked to this quote.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount of the quote.';
                }
                field("Won/Lost Date"; Rec."Won/Lost Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date this quote was closed.';
                }
                field("Won/Lost Reason Desc."; Rec."Won/Lost Reason Desc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reason closing the quote.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        GetQuotesForCurrentUser();
    end;

    local procedure GetQuotesForCurrentUser()
    var
        QuoteStatusMgmt: Codeunit "SOL Quote Status Mgmt";
        SalespersonCode: Code[20];
    begin
        SalespersonCode := QuoteStatusMgmt.GetSalespersonForLoggedInUser();
        Rec.FilterGroup(2);
        Rec.SetRange(Rec."Salesperson Code", SalespersonCode);
        Rec.FilterGroup(0);
    end;
}