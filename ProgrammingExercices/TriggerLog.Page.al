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
            group(GroupName2)
            {
                field("Entrada Entry No."; Rec."Entry No.")
                {
                    Caption = 'Entrada Entry No.';
                    ApplicationArea = All;
                }
                field("Entrada Object Name"; Rec."Object Name")
                {
                    Caption = 'Entrada Object Name';
                    ApplicationArea = All;
                }
                field("Entrada Trigger Name"; Rec."Trigger Name")
                {
                    Caption = 'Entrada Trigger Name';
                    ApplicationArea = All;
                }
                field("Entrada Time"; Rec.Time)
                {
                    Caption = 'Entrada Time';
                    ApplicationArea = All;
                }
            }
            repeater(GroupName)
            {
                Editable = false;
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
                field(Time; Rec.Time)
                {
                    ApplicationArea = All;
                    ToolTip = 'Time';
                }
            }
        }
    }
}