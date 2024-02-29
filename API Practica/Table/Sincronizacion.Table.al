table 50101 "Sincronizacion Table"
{
    Caption = 'Sincronizacion Table';
    DataClassification = CustomerContent;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; Direction; Enum "Direction Enum")
        {
            Caption = 'Direction';
            DataClassification = CustomerContent;
        }
        field(3; Action; Enum "Action Enum")
        {
            Caption = 'Action';
            DataClassification = CustomerContent;
        }
        field(4; Data; Blob)
        {
            Caption = 'Data';
            DataClassification = CustomerContent;
        }
        field(5; Status; Enum "Status Enum")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(6; Error; Blob)
        {
            Caption = 'Error';
            DataClassification = CustomerContent;
        }
    }
}