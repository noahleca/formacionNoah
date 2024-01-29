page 50100 "Customer Reminders Factbox"
{
    Caption = 'Customer Reminders Factbox';
    PageType = ListPart;
    SourceTable = "Reminder/Fin. Charge Entry";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

            }
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