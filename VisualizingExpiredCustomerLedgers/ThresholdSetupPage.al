page 50100 "Threshold Setup Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Threshold Setup";
    InsertAllowed = false;
    DeleteAllowed = false;
    Caption = 'Threshold Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Threshold1Value; Rec.Threshold1Value)
                {
                    ApplicationArea = All;
                    Caption = 'Threshold 1 Value';
                    ToolTip = 'Threshold 1 Value';
                }
                field(Threshold1Style; Rec.Threshold1Style)
                {
                    ApplicationArea = All;
                    Caption = 'Threshold 1 Style';
                    ToolTip = 'Threshold 1 Style';
                }
                field(Threshold2Value; Rec.Threshold2Value)
                {
                    ApplicationArea = All;
                    Caption = 'Threshold 2 Value';
                    ToolTip = 'Threshold 2 Value';
                }
                field(Threshold2Style; Rec.Threshold2Style)
                {
                    ApplicationArea = All;
                    Caption = 'Threshold 2 Style';
                    ToolTip = 'Threshold 2 Style';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.Get() then Rec.Insert();
    end;
}