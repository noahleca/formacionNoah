table 55101 Example
{
    Caption = 'Example Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; FieldOne; Integer)
        {
            Caption = 'Field One.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TriggerLog.InsertLogEntry('Table Example', 'OnValidate Field One');
                ;
            end;
        }
        field(2; FieldTwo; Integer)
        {
            Caption = 'Field Two.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                TriggerLog.InsertLogEntry('Table Example', 'OnValidate Field Two');
            end;
        }
    }
    keys
    {
        key(Key1; FieldOne)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        TriggerLog.InsertLogEntry('Table Example', 'OnDelete');
    end;

    trigger OnInsert()
    begin
        TriggerLog.InsertLogEntry('Table Example', 'OnInsert');
    end;

    trigger OnModify()
    begin
        TriggerLog.InsertLogEntry('Table Example', 'OnModify');
    end;

    trigger OnRename()
    begin
        TriggerLog.InsertLogEntry('Table Example', 'OnRename');
    end;

    var
        TriggerLog: Record TriggerLog;
}