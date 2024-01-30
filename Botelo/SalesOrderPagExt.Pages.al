pageextension 50100 "Sales Order Page Extension" extends "Sales Order"
{
    layout
    {
        addafter(Control1906127307)
        {
            part("Sales Prices Factbox"; "Sales Prices Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Item No." = field("No.");
                Provider = SalesLines;
            }
        }
    }
}