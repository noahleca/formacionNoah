page 55108 "Set range and set filter."
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Set range and set filter.';

    layout
    {
        area(Content)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetCustomersFromAtlanta)
            {
                ApplicationArea = All;
                Caption = 'Get customers from Atlanta';
                ToolTip = 'Get customers from Atlanta';
                Image = Return;

                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.SetFilter(City, 'Atlanta');
                    if Customer.FindSet() then
                        repeat
                            Message('%1', Customer);
                        until Customer.Next() = 0;
                end;
            }
            action(GetCustomersNotFromAtlanta)
            {
                ApplicationArea = All;
                Caption = 'Get customers not from Atlanta';
                ToolTip = 'Get customers not from Atlanta';
                Image = Return;

                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.SetRange(City, '<>%1', 'Atlanta');
                    if Customer.FindSet() then
                        repeat
                            Message('%1', Customer);
                        until Customer.Next() = 0;
                end;
            }
        }
    }

    var
        myInt: Integer;
}