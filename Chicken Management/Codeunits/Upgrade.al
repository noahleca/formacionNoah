codeunit 50101 Upgrade
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        Module: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(Module);
        if Module.DataVersion().Major() = 1 then
            UpdateChickenTypes();
    end;

    local procedure UpdateChickenTypes()
    begin
        UpdateChickenType('CHICKEN001', 'Type 01', 'Chicken Type 01');
        UpdateChickenType('CHICKEN002', 'Type 02', 'Chicken Type 02');
        UpdateChickenType('CHICKEN003', 'Type 03', 'Chicken Type 03');
    end;

    local procedure UpdateChickenType(OldChickenTypeCode: Code[20]; NewChickenTypeCode: Code[20]; NewChickenTypeDescription: Text[100])
    var
        ChickenType: Record ChickenType;
    begin
        if ChickenType.Get(OldChickenTypeCode) then begin
            ChickenType.Rename(NewChickenTypeCode);
            ChickenType.description := NewChickenTypeDescription;
            ChickenType.Modify();
        end;
    end;
}