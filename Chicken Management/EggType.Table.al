table 50102 EggType
{
    Caption = 'Egg Type';
    DrillDownPageId = "Egg Types";
    LookupPageId = "Egg Types";
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
    procedure InsertEggType(EggTypeCode: Code[20]; EggTypeDescription: Text[50])
    var
        EggType: Record EggType;
    begin
        Clear(EggType);
        EggType.code := EggTypeCode;
        EggType.description := EggTypeDescription;
        EggType.Insert();
    end;
}