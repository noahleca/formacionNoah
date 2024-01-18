table 50100 Chicken
{
    Caption = 'Chicken';
    DataClassification = CustomerContent;

    fields
    {
        field(1; no; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; description; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Chicken description.';
        }
        field(3; chickenTypeCode; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ChickenType";
            Caption = ' Chicken type code.';
        }
        field(4; lastDateModified; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Last date modified.';
            Editable = false;
        }
        field(5; picture; MediaSet)
        {
            DataClassification = CustomerContent;
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
        fieldgroup(DropDown; description, chickenTypeCode)
        {
        }
        fieldgroup(Brick; description, picture)
        {
        }
    }
}