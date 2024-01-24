table 55100 TriggerLog
{
    Caption = 'Trigger log.';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Object Name"; Text[100])
        {
            Caption = 'Object Name';
            DataClassification = CustomerContent;
        }
        field(3; "Trigger Name"; Text[100])
        {
            Caption = 'Trigger Name';
            DataClassification = CustomerContent;
        }
        field(4; "Time"; DateTime)
        {
            Caption = 'Time';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }
    local procedure InsertLogEntry(ObjectName: Text[100]; TriggerName: Text[100])
    var
        TriggerLog: Record TriggerLog;
        EntryNo: Integer;
    begin
        TriggerLog.FindSet();
        repeat
            if TriggerLog.Next() = 0 then
                EntryNo := (TriggerLog."Entry No." + 1);
        until TriggerLog.Next() = 0;

        if TriggerLog.Get(TriggerLog."Entry No.") then exit;
        TriggerLog."Entry No." := EntryNo;
        TriggerLog."Object Name" := ObjectName;
        TriggerLog."Trigger Name" := TriggerName;
        TriggerLog.Time := CurrentDateTime;
        TriggerLog.Insert();
    end;

    procedure ClearLogEntries(ObjectName: Text[100]; TriggerName: Text[100])
    var
        TriggerLog: Record TriggerLog;
    begin
        TriggerLog.FindSet();
        if TriggerLog.Next() = 0 then
            Clear(TriggerLog);
        TriggerLog.DeleteAll();
    end;
}