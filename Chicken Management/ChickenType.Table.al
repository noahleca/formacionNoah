table 50101 ChickenType
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; code; Code[20])
        {
            Caption = 'Code.';
        }
        field(2; description; Text[100])
        {
            Caption = 'Description.';
        }
    }

    keys
    {
        key(Key1; code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
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