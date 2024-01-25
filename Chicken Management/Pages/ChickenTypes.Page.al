page 50102 "Chicken Types List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ChickenType;
    Editable = true;
    Caption = 'Chicken Types List';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                field("codeInput"; Rec."code")
                {
                    ToolTip = 'Specifies the value of the Code. field.';
                }
                field("SystemCreatedAtInput"; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field("descriptionInput"; Rec.description)
                {
                    ToolTip = 'Specifies the value of the Description. field.';
                }
            }
            repeater(List)
            {
                Editable = false;
                field("code"; Rec.code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Chicken Type Code';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Chicken Type Creation Date';
                }
                field(description; Rec.description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Chicken Type Description';
                }
            }
        }
    }
}