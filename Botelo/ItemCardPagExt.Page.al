pageextension 50105 "Item Card Extension" extends "Item Card"
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