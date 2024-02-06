pageextension 50056 "SOL Business Manager RC Ext" extends "Business Manager Role Center"
{
    layout
    {
        addbefore("Favorite Accounts")
        {
            part(SalesQuotesWon; "Show Won/Lost Quotes")
            {
                Caption = 'Your Won Sales Quotess';
                ApplicationArea = All;
                SubPageView = where("Won/Lost Quote Status" = const("Won"));
            }
            part(SalesQuotesLost; "Show Won/Lost Quotes")
            {
                Caption = 'Your Lost Sales Quotes';
                ApplicationArea = All;
                SubPageView = where("Won/Lost Quote Status" = const("Lost"));
            }
        }
    }
}