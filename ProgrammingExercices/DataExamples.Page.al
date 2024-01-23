page 55105 DataManipulationExamples
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'DataManipulationExamples';

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
            action(FindSomeRecords)
            {
                ApplicationArea = All;
                Caption = 'Find Some Records';
                ToolTip = 'Find Some Records';
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    //Customer.FindFirst();
                    //Customer.FindLast();
                    Customer.FindSet();
                    repeat
                        Message('%1', Customer);
                    until Customer.Next() = 0;
                end;
            }
        }
    }
}