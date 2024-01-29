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
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'No.';
                    ApplicationArea = All;
                }

                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Posting Date';
                    ApplicationArea = All;
                }

                field("User ID"; Rec."User ID")
                {
                    Caption = 'User ID';
                    ToolTip = 'User ID';
                    ApplicationArea = All;
                }

                field("Document Date"; Rec."Document Date")
                {
                    Caption = 'Document Date';
                    ToolTip = 'Document Date';
                    ApplicationArea = All;
                }

                field("Document Type"; Rec."Document Type")
                {
                    Caption = 'Document Type';
                    ToolTip = 'Document Type';
                    ApplicationArea = All;
                }

                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    Caption = 'Remaining Amount';
                    ToolTip = 'Remaining Amount';
                    ApplicationArea = All;
                }
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