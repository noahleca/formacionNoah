table 50100 Chicken
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; no; Code[20])
        {
            Caption = 'No.';
        }
        field(2; description; Text[100])
        {
            Caption = 'Chicken description.';
        }
        field(3; chickenTypeCode; Code[20])
        {
            Caption = ' Chicken type code.';
            TableRelation = "ChickenType";
        }
        field(4; lastDateModified; Date)
        {
            Caption = 'Last date modified.';
        }
        field(5; picture; MediaSet)
        {
            Caption = 'Picture.';
        }
    }

    keys
    {
        key(Key1; no)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "no", description, chickenTypeCode)
        {
        }
        fieldgroup(Brick; "no", description, picture)
        {
        }
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