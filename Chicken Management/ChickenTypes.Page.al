page 50102 "Chicken Types"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ChickenType;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("code"; Rec."code")
                {
                    ToolTip = 'Specifies the value of the Code. field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(description; Rec.description)
                {
                    ToolTip = 'Specifies the value of the Description. field.';
                }
            }
        }
    }
}