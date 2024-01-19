page 50105 MyPage
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;

    SourceTable = "Egg Production Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document date. field.';
                }
            }
        }
    }
}