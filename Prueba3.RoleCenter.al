page 3 "Role Center Page 3"
{
    PageType = Card;
    Caption = 'Role Center Page 3';

    layout
    {
        area(embedding)
        {
            action (Customers)
            {
                Caption = 'Customers';
                RunObject = Page "Customer List";
            }
            action (Vendors)
            {
                Caption = 'Vendors';
                RunObject = Page "Vendor List";
            }
            action (Items)
            {
                Caption = 'Items';
                RunObject = Page "Item List";
            }
            action ("Bank Accounts")
            {
                Caption = 'Bank Accounts';
                RunObject = Page "Bank Account List";
            }
            action ("Chart of Accounts")
            {
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
            }
        }
    }
}