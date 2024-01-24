table 55110 MyDevCustomer
{
    DataClassification = CustomerContent;
    Caption = 'MyDevCustomer';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Nombre"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Nombre';
        }
        field(3; "Ciudad"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Ciudad';
        }
    }

    keys
    {
        key(key1; "No.")
        {
            Clustered = true;
        }
    }
}