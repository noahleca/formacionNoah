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
            Caption = 'Chicken type code.';
            trigger OnValidate()
            begin
                CalcFields(chickenTypeDescription)
            end;
        }
        field(6; chickenTypeDescription; Text[100])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(ChickenType.description);
            TableRelation = "ChickenType";
            Caption = 'Chicken type description.';
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
        field(7; "Number of Egg Produced"; Decimal)
        {
            Caption = 'Number of Egg Produced.';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Egg Production Line".Quantity
                            where(
                                "Chicken No." = field(no),
                                "Egg Production Date" = field("Date Filter"),
                                "Egg Type Code" = field("Egg Type Filter")
            )
            );
        }
        field(8; "Date Filter"; Date)
        {
            Caption = 'Date filter.';
            FieldClass = FlowField;
        }
        field(9; "Egg Type Filter"; Code[20])
        {
            Caption = 'Egg type filter.';
            FieldClass = FlowField;
            TableRelation = EggType;
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

    trigger OnDelete()
    var
        EggProductionLine: Record "Egg Production Line";
        ChickenHasEggsErr: Label 'The Chicken %1 %2 has eggs, you can''t detele it.', Comment = '%1 = no ; %2 = description';
    begin
        Clear(EggProductionLine);
        EggProductionLine.SetRange("Chicken No.", Rec.no);

        if not EggProductionLine.IsEmpty() then
            Error('No se puede borrar el pollo porque está en la linea de producción de huevos.');
    end;
}