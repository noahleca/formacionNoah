tableextension 50100 "Cust. Ledger Table Extension" extends "Cust. Ledger Entry"
{
    procedure GetNumberOfDaysExpired(CustomerLedgerEntry: Record "Cust. Ledger Entry"): Integer
    var
        Today: Date;
        DaysExpired: Integer;
    begin
        Today := TODAY;
        if CustomerLedgerEntry."Due Date" < Today then begin
            DaysExpired := Abs(Today - CustomerLedgerEntry."Due Date");
            exit(DaysExpired);
        end
        else begin
            exit(0);
        end;
    end;

    var
        myInt: Integer;
}