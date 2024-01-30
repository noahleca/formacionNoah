pageextension 50104 "Item List Extension" extends "Item List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Sales Prices Factbox"; "Sales Prices Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Item No." = field("No.");
            }
        }
    }
}