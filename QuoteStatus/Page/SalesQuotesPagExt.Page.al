pageextension 50054 "Sales Quotes Extension" extends "Sales Quotes"
{
    layout
    {
        addafter("Due Date")
        {
            field("Won/Lost Quote Status"; "Won/Lost Quote Status")
            {
                ApplicationArea = All;
                ToolTip = 'Won/Lost Quote Status';
            }
            field("Won/Lost Date"; "Won/Lost Date")
            {
                ApplicationArea = All;
                ToolTip = 'Won/Lost Date';
            }
            field("Won/Lost Reason Code"; "Won/Lost Reason Code")
            {
                ApplicationArea = All;
                ToolTip = 'Won/Lost Reason Code';
            }
            field("Won/Lost Reason Desc."; "Won/Lost Reason Desc.")
            {
                ApplicationArea = All;
                ToolTip = 'Won/Lost Reason Desc.';
            }
            field("Won/Lost Remarks"; "Won/Lost Remarks")
            {
                ApplicationArea = All;
                ToolTip = 'Won/Lost Remarks';
            }
        }
    }

    var
        "Won/Lost Quote Status": Enum "Won/Lost Status";
        "Won/Lost Date": DateTime;
        "Won/Lost Reason Code": Code[10];
        "Won/Lost Reason Desc.": Text[100];
        "Won/Lost Remarks": Text[2048];
}