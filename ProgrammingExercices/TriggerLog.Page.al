page 55111 "TriggerLog List"
{
    PageType = ListPlus;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TriggerLog;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entry No.';
                }
                field("Object Name"; Rec."Object Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Object Name';
                }
                field("Trigger Name"; Rec."Trigger Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Trigger Name';
                }
                field("Time"; Rec.Time)
                {
                    ApplicationArea = All;
                    ToolTip = 'Time';
                }
            }
        }
    }
}