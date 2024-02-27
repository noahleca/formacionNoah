report 50105 ItemInventoryAvailability
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Inventory and Availability, by Item Category';
    RDLCLayout = './src/ItemInventoryAvailability/ItemInventoryAvailability.rdlc';
    ExcelLayout = './src/ItemInventoryAvailability/ItemInventoryAvailability.xlsx';
    DefaultLayout = Excel;
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_Customer; "No.")
            { }
            column(Name_Customer; Name)
            { }
            column(Name2_Customer; "Name 2")
            { }
            column(Address_Customer; Address)
            { }
            column(Address2_Customer; "Address 2")
            { }
            column(BalanceLCY_Customer; "Balance (LCY)")
            { }
            column(Email_Customer; "E-Mail")
            { }
        }
    }
}