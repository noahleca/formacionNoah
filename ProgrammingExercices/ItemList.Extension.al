pageextension 55100 MyExtension extends "Item List"
{
    layout
    {
        addlast(content)
        {
            field(Availability; Rec.Availability)
            {
                Caption = 'Availability';
                trigger OnValidate();
                begin

                end;
            }
        }
    }

    actions
    {
    }

    var
        myInt: Integer;
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