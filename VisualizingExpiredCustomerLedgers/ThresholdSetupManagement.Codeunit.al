codeunit 50100 "Threshold Management Cdoeunit"
{
    procedure RunThresholdSetup(var TresholdSetupNotification: Notification)
    var
        ThresholdSetup: Page "Threshold Setup Page";
    begin
        ThresholdSetup.Run();
    end;
}