pageextension 50101 "Customer Ledger Entries Ext" extends "Customer Ledger Entries"
{
    layout
    {
        addfirst(factboxes)
        {
            part("Customer Reminders Factbox"; "Customer Reminders Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Entry No." = field("Entry No.");
            }
        }
    }
}