report 50102 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem(Customer; Customer)
        {
            PrintOnlyIfDetail = true;
            column(No_Customer; "No.")
            {
            }
            column(Name_Customer; Name)
            {
            }
            dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
            {
                DataItemLinkReference = Customer;
                DataItemLink = "Customer No." = field("No.");
                column(Customer_No; "Customer No.")
                {
                }
                column(Amount_LCY; "Amount (LCY)")
                {
                }
            }
        }
    }
}