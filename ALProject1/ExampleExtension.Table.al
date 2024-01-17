tableextension 50100 RetailWinterSportsStore extends Customer
{
    fields
    {
        field(50100; ShoeSize; Integer)
        {
            trigger OnValidate()
            begin
                if (rec.ShoeSize < 0) then begin
                    Message('Shoe size not valid: %1', rec.ShoeSize);
                end;
            end;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}