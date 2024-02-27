report 50106 Union
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Demo Union';
    ExcelLayout = './src/demo/Union.xlsx';
    DefaultLayout = Excel;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_Customer; "No.")
            { }
            column(Name_Customer; Name)
            { }
        }
        dataitem(Vendor; Vendor)
        {
            column(No_Vendor; "No.")
            { }
            column(Name_Vendor; Name)
            { }
        }
    }
}