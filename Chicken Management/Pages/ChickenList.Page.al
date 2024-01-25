page 50101 ChickenList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Chicken;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(no; Rec.no)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(description; Rec.description)
                {
                    ToolTip = 'Specifies the value of the Chicken description. field.';
                }
                field(chickenTypeCode; Rec.chickenTypeCode)
                {
                    ToolTip = 'Specifies the value of the  Chicken type code. field.';
                }
                field(chickenTypeDescription; Rec.chickenTypeDescription)
                {
                    ToolTip = 'Specifies the value of the Chicken type description. field.';
                }
                field("Number of Egg Produced"; Rec."Number of Egg Produced")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number of Egg Produced. field.';
                }
            }
        }
    }
}