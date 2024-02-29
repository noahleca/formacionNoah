page 50100 "User MGS List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "User MGS Table";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the record.';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name of the record.';
                }
                field(Email; Rec.Email)
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the email of the record.';
                }
                field("External Id"; Rec."External Id")
                {
                    Caption = 'External Id';
                    ToolTip = 'Specifies the external id of the record.';
                }
            }
        }
    }
}