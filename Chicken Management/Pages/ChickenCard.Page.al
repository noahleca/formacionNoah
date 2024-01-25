page 50100 "Chicken Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Chicken;

    layout
    {
        area(Content)
        {
            group(General)
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
                field(lastDateModified; Rec.lastDateModified)
                {
                    ToolTip = 'Specifies the value of the Last date modified. field.';
                }
                field(picture; Rec.picture)
                {
                    ToolTip = 'Specifies the value of the Picture. field.';
                }
                field(chickenTypeDescription; Rec.chickenTypeDescription)
                {
                    ToolTip = 'Specifies the value of the Chicken type description. field.';
                }
            }
        }
    }
}