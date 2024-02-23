reportextension 50100 CustomersAndVendorsRepExt extends CustomersAndVendors
{
    RDLCLayout = 'src/CustomersAndVendorsRepExt.rdl';

    dataset
    {

        add(Customer)
        {
            
            column(City_Customer; City)
            { }
        }
        add(Vendor)
        {
            column(City_Vendor; City)
            { }
        }
        addlast(Vendor)
        {
            dataitem(Contact; Contact)
            {
                column(Dataitem_Contact; 'Dataitem_Contact')
                { }
                column(No_Contact; "No.")
                { }
                column(Name_Contact; Name)
                { }
                column(City_Contact; City)
                { }
            }
        }
    }
}