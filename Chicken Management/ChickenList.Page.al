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
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}