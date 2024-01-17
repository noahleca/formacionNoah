table 50100 Example
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; MyField2; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'My field 2.';
        }
    }

    keys
    {
        key(Key1; MyField)
        {
            Clustered = true;
        }
        key(sk; MyField2)
        {
            MaintainSqlIndex = false;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}