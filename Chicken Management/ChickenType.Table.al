table 50101 ChickenType
{
    Caption = 'Chicken Type';
    DrillDownPageId = "Chicken Types";
    LookupPageId = "Chicken Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; code; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Code.';
        }
        field(2; description; Text[100])
        {
            DataClassification = CustomerContent;
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
}