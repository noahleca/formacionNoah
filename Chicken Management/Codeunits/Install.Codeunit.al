codeunit 50100 Install
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        ChickenType: Record ChickenType;
    begin

        if ChickenType.IsEmpty then
            InsertDefaultChickenTypes();
    end;

    local procedure InsertDefaultChickenTypes()
    var
        /*i: Integer;
        tempCode: Code[20];
        tempDescription: Text[100];*/
        ChickenType: Record ChickenType;
    begin
        /*for i := 120 to 130 do begin
            tempCode := Format('CHICKEN%1', i);
            tempDescription := Format('Chicken type %1.', i);
            if StrLen(tempDescription) > 100 then
                tempDescription := StrSubstNo(tempDescription, 1, 100);
            InsertChickenType(tempCode, tempDescription);
        end;*/
        Clear(ChickenType);
        if not ChickenType.IsEmpty then exit;

        InsertChickenType('CHICKEN001', 'Chicken type 001.');
        InsertChickenType('CHICKEN002', 'Chicken type 002.');
        InsertChickenType('CHICKEN003', 'Chicken type 003.');
        InsertChickenType('CHICKEN004', 'Chicken type 004.');
        InsertChickenType('CHICKEN005', 'Chicken type 005.');
    end;

    local procedure InsertChickenType(ChickenTypeCode: Code[20]; ChickenTypeDescription: Text[100])
    var
        ChickenType: Record ChickenType;
    begin
        Clear(ChickenType);
        ChickenType.Init();
        ChickenType.code := ChickenTypeCode;
        ChickenType.description := ChickenTypeDescription;
        ChickenType.Insert();
    end;
}