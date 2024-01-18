page 50103 "Egg Types"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EggType;

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
                field(description; Rec.description)
                {
                    ToolTip = 'Specifies the value of the Description. field.';
                }
            }
        }
    }
}