page 55107 "Filtering Examples"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Filtering Examples';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetItem)
            {
                ApplicationArea = All;
                Caption = 'Get item';
                ToolTip = 'Get item';
                Image = Return;

                trigger OnAction()
                var
                    Item: Record Item;
                begin
                    if Item.get('1900-S') then
                        Message('%1', Item);
                end;
            }
        }
    }

    var
        myInt: Integer;
}