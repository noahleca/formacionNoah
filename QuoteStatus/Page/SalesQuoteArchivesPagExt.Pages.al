pageextension 50102 "Sales Quote Archives Extension" extends "Sales Quote Archives"
{
    layout
    {
        addlast(Control1)
        {
            field("Won/Lost Quote Status"; "Won/Lost Quote Status")
            {
                ApplicationArea = All;
                Caption = 'Won/Lost Quote Status';
                ToolTip = 'Won/Lost Quote Status';
            }
            field("Won/Lost Date"; "Won/Lost Date")
            {
                ApplicationArea = All;
                Caption = 'Won/Lost Date';
                ToolTip = 'Won/Lost Date';
            }
            field("Won/Lost Reason Code"; "Won/Lost Reason Code")
            {
                ApplicationArea = All;
                Caption = 'Won/Lost Reason Code';
                ToolTip = 'Won/Lost Reason Code';
            }
            field("Won/Lost Reason Desc."; "Won/Lost Reason Desc.")
            {
                ApplicationArea = All;
                Caption = 'Won/Lost Reason Desc.';
                ToolTip = 'Won/Lost Reason Desc.';
            }
            field("Won/Lost Remarks"; "Won/Lost Remarks")
            {
                ApplicationArea = All;
                Caption = 'Won/Lost Remarks';
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