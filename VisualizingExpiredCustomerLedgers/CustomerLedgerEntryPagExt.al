pageextension 50100 "Cust. Ledger Page Extension" extends "Customer Ledger Entries"
{
    layout
    {
        addlast(content)
        {
            field(Nu; Integer)
            {
                
    ApplicationArea = All;
    Editable = false;
    Caption = 'Number of Days Expired';
    ToolTip = 'The number of days this entry is expired, based upon Due Date and today.';
    StyleExpr = ;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}