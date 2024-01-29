pageextension 50102 CustomerListPagExt extends "Customer List"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Customer Reminders Factbox"; "Customer Reminders Factbox")
            {
                SubPageLink = "Customer No." = field("No.");
                ApplicationArea = All;
            }
        }
    }
}