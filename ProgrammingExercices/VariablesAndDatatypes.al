codeunit 55100 VariablesAndDatatypes
{
    trigger OnRun()
    begin
        Message('The value of %1 is %2', 'LoopNo', LoopNo);
    end;

    var
        Color: Option Red,Green,Blue;
        LoopNo: Integer;
        MyDate: Date;
        MyText: Text;
        LoopNoDec: Decimal;
}

pageextension 55101 "Customers Extension" extends "Customer List"
{
    actions
    {
        addfirst("&Customer")
        {
            action(RunVariablesAndDatatypes)
            {
                ApplicationArea = All;
                Caption = 'Run Variables and Datatypes';
                ToolTip = 'Run Variables and Datatypes';
                Image = Action;

                trigger OnAction()
                var
                    VariablesAndDatatypes: Codeunit VariablesAndDatatypes;

                begin
                    VariablesAndDatatypes.Run();
                end;
            }
        }
    }
}