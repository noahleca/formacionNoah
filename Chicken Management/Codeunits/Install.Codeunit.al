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
        i: Integer;
        tempCode: Code[20];
        tempDescription: Text[100];
    begin
        for i := 1 to 10 do begin
            tempCode := Format('CHICKEN%1', i);
            tempDescription := Format('Chicken type %1.', i);
            InsertChickenType(tempCode, tempDescription);
        end;
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