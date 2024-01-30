table 50100 "Threshold Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Threshold Setup';

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary key.';
        }
        field(2; Threshold1Value; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 1 value';
        }
        field(3; Threshold2Value; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 2 value';
        }
        field(4; Threshold1Style; Enum "Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 1 style';
        }
        field(5; Threshold2Style; Enum "Style Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Threshold 2 style';
        }
    }
    keys
    {
        key(Key1; PrimaryKey)
        {
            Clustered = true;
        }
    }
}