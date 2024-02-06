codeunit 50100 "SOL Quote Status Mgmt"
{
    procedure GetSalespersonForLoggedInUser(): Code[20]
    var
        Salesperson: Record "Salesperson/Purchaser";
        User: Record User;
    begin
        User.Reset();
        if not User.Get(UserSecurityId()) then exit('');
        if User."Contact Email".Trim() = '' then exit('');
        Salesperson.Reset();
        Salesperson.SetRange("E-Mail", User."Contact Email");
        if Salesperson.FindFirst() then
            exit(Salesperson.Code);
    end;

    procedure CloseQuote(var SalesHeader: Record "Sales Header")
    begin
        ArchiveSalesQuote(SalesHeader);
    end;

    local procedure ArchiveSalesQuote(var SalesHeader: Record "Sales Header")
    var
        SalesSetup: Record "Sales & Receivables Setup";
        ArchiveManagement: Codeunit ArchiveManagement;
    begin
        SalesSetup.Get();

        case SalesSetup."Archive Quotes" of
            SalesSetup."Archive Quotes"::Always:
                ArchiveManagement.ArchSalesDocumentNoConfirm(SalesHeader);
            SalesSetup."Archive Quotes"::Question:
                ArchiveManagement.ArchiveSalesDocument(SalesHeader);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ArchiveManagement, 'OnBeforeSalesHeaderArchiveInsert', '', true, true)]
    local procedure OnBeforeSalesHeaderArchiveInsert(var SalesHeaderArchive: Record "Sales Header Archive"; SalesHeader: Record "Sales Header")
    begin
        if (SalesHeader."Document Type" <> SalesHeader."Document Type"::Quote) then exit;
        SalesHeaderArchive."Won/Lost Quote Status" := SalesHeader."Won/Lost Quote Status";
        SalesHeaderArchive."Won/Lost Date" := SalesHeader."Won/Lost Date";
        SalesHeaderArchive."Won/Lost Reason Code" := SalesHeader."Won/Lost Reason Code";
        SalesHeaderArchive."Won/Lost Reason Desc." := SalesHeader."Won/Lost Reason Desc.";
        SalesHeaderArchive."Won/Lost Remarks" := SalesHeader."Won/Lost Remarks";
    end;
}