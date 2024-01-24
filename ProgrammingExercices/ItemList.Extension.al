pageextension 55100 ItemList extends "Item List"
{
    layout
    {
        addafter(InventoryField)
        {
            field(Availability; Availability)
            {
                ApplicationArea = All;
                Caption = 'Availability';
                ToolTip = 'Availability';
                Editable = false;
                StyleExpr = "FieldStyle";
            }
        }
    }

    var
        Availability: Integer;
        FieldStyle: Text;

    trigger OnAfterGetRecord()
    begin
        rec.CalcFields(rec."Qty. on Purch. Order", rec."Qty. on Sales Order", rec.Inventory);
        Availability := rec.Inventory + rec."Qty. on Purch. Order" - rec."Qty. on Sales Order";

        if Availability = rec.Inventory then FieldStyle := 'Standard';
        if Availability < rec.Inventory then FieldStyle := 'Attention';
        if Availability > rec.Inventory then FieldStyle := 'Favorable';
    end;
}

tableextension 55100 "Item Table Extension" extends Item
{
    fields
    {
        field(55100; Availability; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Availability';
        }
    }
}
