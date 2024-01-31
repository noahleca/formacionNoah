pageextension 50100 "Cust. Ledger Page Extension" extends "Customer Ledger Entries"
{
    layout
    {
        addlast(Control1)
        {
            field(NumberOfDaysExpired; NumberOfDaysExpired)
            {
                ApplicationArea = All;
                Editable = false;
                Caption = 'Number of Days Expired';
                ToolTip = 'The number of days this entry is expired, based upon Due Date and today.';
                StyleExpr = DaysExpiredStyle;
            }
        }
    }

    views
    {
        addfirst
        {
            view("Open Entries")
            {
                Caption = 'Open Entries';
                OrderBy = ascending("Due Date");
                Filters = where(Open = const(true));
                SharedLayout = false;
                layout
                {
                    movefirst(Control1; NumberOfDaysExpired)
                    moveafter(NumberOfDaysExpired; "Due Date")
                }
            }
        }
    }

    var
        NumberOfDaysExpired: Integer;
        DaysExpiredStyle: Text;
        ThresholdSetup: Record "Threshold Setup";

    trigger OnOpenPage()
    begin
        if not ThresholdSetup.Get() then begin
            ShowThresholdSetupNotification();
            CurrPage.Update();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        NumberOfDaysExpired := rec.GetNumberOfDaysExpired();
        case
            NumberOfDaysExpired of
            ThresholdSetup."Threshold1Value" .. ThresholdSetup."Threshold2Value":
                DaysExpiredStyle := format(ThresholdSetup."Threshold1Style");
            ThresholdSetup."Threshold2Value" .. 99999:
                DaysExpiredStyle := format(ThresholdSetup."Threshold2Style");
            else
                DaysExpiredStyle := 'None';
        end;
    end;

    procedure ShowThresholdSetupNotification()
    var
        ThresholdSetupNotification: Notification;
        ThresholdNotificationMessageLbl: Label 'You need to run the Threshold Setup:';
        ThresholdNotificationAddActionLbl: Label 'Click here to run the ThresholdSetup';
        ThresholdNotificationButtonLbl: Label 'RunThresholdSetup';
    begin
        ThresholdSetupNotification.Message(ThresholdNotificationMessageLbl);
        ThresholdSetupNotification.AddAction(ThresholdNotificationAddActionLbl, Codeunit::"Threshold Management Cdoeunit", ThresholdNotificationButtonLbl);
        ThresholdSetupNotification.Send();
    end;
}