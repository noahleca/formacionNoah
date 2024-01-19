table 50104 "Egg Production Line"
{
    Caption = 'Egg Production Line.';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document no.';
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line no.';
        }
        field(3; "Chicken No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Chicken no.';
            TableRelation = Chicken;
        }
        field(4; "Chicken Description"; Text[100])
        {
            Caption = 'Chicken description.';
            FieldClass = FlowField;
            CalcFormula = lookup(Chicken.description);
        }
        field(5; "Egg Production Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Egg production date.';
        }
        field(6; "Egg Type Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Egg type code.';
        }
        field(7; "Egg Type Description"; Text[100])
        {
            Caption = 'Egg type description.';
            FieldClass = FlowField;
            CalcFormula = lookup(EggType.description);
        }
        field(8; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity.';
        }
    }

    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}