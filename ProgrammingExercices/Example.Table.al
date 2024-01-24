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
        }
        field(2; FieldTwo; Integer)
        {
            Caption = 'Field Two.';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; FieldOne)
        {
            Clustered = true;
        }
    }
}