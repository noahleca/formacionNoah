page 55112 ExampleList
{
    ApplicationArea = All;
    Caption = 'Example List';
    PageType = List;
    SourceTable = Example;
    UsageCategory = Lists;
    CardPageId = "Example Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(FieldOne; Rec.FieldOne)
                {
                    ToolTip = 'Specifies the value of the Field One field.';
                }
                field(FieldTwo; Rec.FieldTwo)
                {
                    ToolTip = 'Specifies the value of the Field Two field.';
                }
            }
        }
    }
}