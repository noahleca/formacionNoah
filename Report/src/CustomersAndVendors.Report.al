report 50100 CustomersAndVendors
{
    Caption = 'Customers And Vendors Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'src/CustomersAndVendors.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Dataitem_Customer; 'DataItem_Customer')
            { }
            column(No_Customer; "No.")
            { }
            column(Name_Customer; Name)
            { }
        }
        dataitem(Vendor; Vendor)
        {
            column(Dataitem_Vendor; 'DataItem_Vendor')
            { }
            column(No_Vendor; "No.")
            { }
            column(Name_Vendor; Name)
            { }
        }
    }
}