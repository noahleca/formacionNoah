codeunit 55101 StringOperator
{
    trigger OnRun()
    begin
        String1 := 'HelloWorldOfManManyCharactersInTheString';
        String2 := CopyStr(String1, 1, MaxStrLen(String2));
        Message(String2);
    end;

    var
        String1: Text[60];
        String2: Text[30];
}

pageextension 55101 "Customers Extension" extends "Customer List"
{
    trigger OnOpenPage()
    begin
        Codeunit.Run(Codeunit::StringOperator)
    end;
}