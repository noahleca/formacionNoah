tableextension 50100 "Sales Header Table Extension" extends "Sales Header"
{
    fields
    {
        field(1000; "Won/Lost Quote Status"; Enum "Won/Lost Status")
        {
            Caption = 'Quote Status';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "Won/Lost Date" = 0DT then
                    "Won/Lost Date" := CurrentDateTime();
            end;
        }
        field(1001; "Won/Lost Date"; DateTime)
        {
            Caption = 'Won/Lost Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(1002; "Won/Lost Reason Code"; Code[10])
        {
            Caption = 'Won/Lost Reason Code';
            DataClassification = CustomerContent;
            TableRelation = if ("Won/Lost Quote Status" = const(Won)) "Close Opportunity Code" where(type = const(Won))
            else
            if ("Won/Lost Quote Status" = const(Lost)) "Close Opportunity Code" where(type = const(Lost));
            trigger OnValidate()
            begin
                CalcFields("Won/Lost Reason Desc.");
            end;
        }
        field(1003; "Won/Lost Reason Desc."; Text[100])
        {
            Caption = 'Won/Lost Reason Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Close Opportunity Code".Description where(Code = field("Won/Lost Reason Code")));
            Editable = false;
        }
        field(1004; "Won/Lost Remarks"; Text[2048])
        {
            Caption = 'Won/Lost Remarks';
            DataClassification = CustomerContent;
        }
    }
}