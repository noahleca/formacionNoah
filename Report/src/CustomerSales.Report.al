report 50101 CustomerSales  
{
    Caption = 'Customer Sales Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Extensible = true;
    RDLCLayout = 'src/CustomerSales.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_Customer; "No.")
            {
                IncludeCaption = true;
            }
            column(Name_Customer; Name)
            {
                IncludeCaption = true;
            }
            dataitem(customerLedger; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = field("No.");
                column(CustomerNo_CustomerLedger; "Customer No.")
                {
                    IncludeCaption = true;
                }
                column(PostingDate_CustomerLedger; "Posting Date")
                {
                    IncludeCaption = true;
                }
                column(AmountLCY_CustomerLedger; "Amount (LCY)")
                { }
            }
        }
    }
}