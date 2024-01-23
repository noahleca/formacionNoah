page 55106 "Findset Loop"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Findset Loop';

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
            action(LoopOverAllVendors)
            {
                ApplicationArea = All;
                Caption = 'Findset Loop';
                ToolTip = 'Findset Loop';

                trigger OnAction()
                var
                    Vendor: Record Vendor;
                begin
                    Vendor.FindSet();
                    repeat
                        Message('%1', Vendor);
                    until Vendor.Next() = 0;
                end;
            }
        }
    }

    var
        myInt: Integer;
}