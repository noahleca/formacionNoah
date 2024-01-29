pageextension 50103 CustomerCardPagExt extends "Customer Card"
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