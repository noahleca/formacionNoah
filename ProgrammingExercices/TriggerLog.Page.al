page 55111 "Trigger Log List"
{
    ApplicationArea = All;
    Caption = 'Trigger Log List';
    PageType = List;
    SourceTable = TriggerLog;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Entry No.';
                }
                field("Object Name"; Rec."Object Name")
                {
                    ToolTip = 'Object Name';
                }
                field("Trigger Name"; Rec."Trigger Name")
                {
                    ToolTip = 'Trigger Name';
                }
                field(Time; Rec.Time)
                {
                    ToolTip = 'Time';
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(DeleteLogEntries)
            {
                ApplicationArea = All;
                Caption = 'Delete Log Entries';
                ToolTip = 'Deletes all log entries.';
                Image = ClearLog;
                Promoted = true;

                trigger OnAction()
                var
                    TriggerLog: Record TriggerLog;
                begin
                    TriggerLog.ClearLogEntries();
                end;
            }
        }
    }
}