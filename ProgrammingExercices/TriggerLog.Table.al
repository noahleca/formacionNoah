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
    procedure InsertLogEntry(ObjectName: Text[100]; TriggerName: Text[100])
    var
        TriggerLog: Record TriggerLog;
        EntryNo: Integer;
    begin
        Clear(TriggerLog);
        Clear(EntryNo);
        if TriggerLog.FindLast() then
            EntryNo := TriggerLog."Entry No." + 1
        else
            EntryNo := 1;
        Clear(TriggerLog);
        TriggerLog."Entry No." := EntryNo;
        TriggerLog."Object Name" := ObjectName;
        TriggerLog."Trigger Name" := TriggerName;
        TriggerLog.Time := CurrentDateTime;

        TriggerLog.Insert();
    end;

    procedure ClearLogEntries()
    var
        TriggerLog: Record TriggerLog;
    begin
        TriggerLog.FindSet();
        if not TriggerLog.IsEmpty() then
            if Confirm('Estas seguro de que quieres eliminar todos los registros de triggers?') then
                TriggerLog.DeleteAll();
    end;
}