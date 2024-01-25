codeunit 55103 Install
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        Shoesize: Record Shoesize;
    begin
        if Shoesize.IsEmpty then
            InsertDefaultShoesizes();
    end;

    local procedure InsertDefaultShoesizes()
    begin
        InsertShoesize('36', 'size 36');
        InsertShoesize('37', 'size 37');
        InsertShoesize('38', 'size 38');
        InsertShoesize('39', 'size 39');
        InsertShoesize('40', 'size 40');
    end;

    local procedure InsertShoesize(ShoesizeCode: Code[20]; ShoesizeDescription: Text[50])
    var
        Shoesize: Record Shoesize;
    begin
        Clear(Shoesize);
        Shoesize.Init();
        Shoesize.Code := ShoesizeCode;
        Shoesize.Description := ShoesizeDescription;
        Shoesize.Insert();
    end;
}