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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}