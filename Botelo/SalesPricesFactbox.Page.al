page 50101 "Sales Prices Factbox"
{
    Caption = 'Sales Prices Factbox';
    PageType = ListPart;
    SourceTable = "Sales Price";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    ToolTip = 'Item No.';
                }
                field("Sales Code"; Rec."Sales Code")
                {
                    ApplicationArea = All;
                    Caption = 'Sales Code';
                    ToolTip = 'Sales Code';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Price';
                    ToolTip = 'Unit Price';
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Quantity';
                    ToolTip = 'Minimum Quantity';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Unit of Measure Code';
                }
            }
        }
    }
}