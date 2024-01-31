tableextension 50100 "Cust. Ledger Table Extension" extends "Cust. Ledger Entry"
{
    procedure GetNumberOfDaysExpired(): Integer
    var
        NumberOfDays: Integer;
    begin
        if Today() <= "Due Date" then
            exit(0);
        NumberOfDays := "Due Date" - Today();
        exit(Abs(NumberOfDays));
    end;
}