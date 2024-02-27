report 50101 CustomerList
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Customer List Report';
    RDLCLayout = './src/CustomerList.rdl';
    WordLayout = './src/CustomerList.docx';
    DefaultLayout = RDLC;
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
            column(City_Customer; City)
            {
                IncludeCaption = true;
            }
            column(BalanceLCY_Customer; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
        }
    }
}