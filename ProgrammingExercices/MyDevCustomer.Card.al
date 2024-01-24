page 55110 "MyDevCustomer Card"
{
    Caption = 'MyDevCustomer Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = MyDevCustomer;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                }
                field(Nombre; rec.Nombre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Nombre';
                }
                field(Ciudad; rec.Ciudad)
                {
                    ApplicationArea = All;
                    ToolTip = 'Ciudad';
                }
            }
        }
    }
}