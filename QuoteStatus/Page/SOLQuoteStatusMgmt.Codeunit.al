codeunit 50057 "SOL Quote Status Mgmt"
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", 'OnRoleCenterOpen', '', true, true)]
    local procedure OnRoleCenterOpen()
    var
        SalespersonCode: Code[20];
    begin
        SalespersonCode := GetSalespersonForLoggedInUser();
        if SalespersonCode = '' then exit;
        GetQuoteRecords("Won/Lost Status"::Won, SalespersonCode);
        GetQuoteRecords("Won/Lost Status"::Lost, SalespersonCode);
    end;

    local procedure GetQuoteRecords(WonLostStatus: Enum "Won/Lost Status"; SalespersonCode: Code[20])
    var
        SalesHeader: Record "Sales Header";
        NoOfRecords: Integer;
    begin
        FilterQuotes(SalesHeader, WonLostStatus, SalespersonCode);
        NoOfRecords := SalesHeader.Count();

        if NoOfRecords <> 0 then
            SendNoOfQuoteNotification(NoOfRecords, WonLostStatus, SalespersonCode);
    end;

    local procedure AddDaysToDateTime(SourceDateTime: DateTime; NoOfDays: Integer): DateTime
    begin
        exit(SourceDateTime + (NoOfDays * 86400000))
    end;

    local procedure SendNoOfQuoteNotification(NoOfQuotes: Integer; WonLostStatus: Enum "Won/Lost Status"; SalespersonCode: Code[20])
    var
        QuoteNotification: Notification;
        YouWonLostQuotesMsg: Label 'You %1 ''%2'' quote(s) during the last 5 days.', Comment = '%1 = Won/Lost ; %2 = No of quotes';
        ShowQuotesLbl: Label 'Show %1 Quotes', Comment = '%1 = Won/Lost';
    begin
        QuoteNotification.Message := StrSubstNo(YouWonLostQuotesMsg, WonLostStatus, NoOfQuotes);
        QuoteNotification.SetData('SalespersonCode', SalespersonCode);
        QuoteNotification.SetData('WonLostStatus', Format(WonLostStatus.AsInteger()));
        QuoteNotification.AddAction(StrSubstNo(ShowQuotesLbl, WonLostStatus), Codeunit::"SOL Quote Status Mgmt", 'OpenQuotes');
        QuoteNotification.Send();
    end;

    procedure OpenQuotes(QuoteNotification: Notification)
    var
        SalesHeader: Record "Sales Header";
        WonLostStatus: Enum "Won/Lost Status";
        SalespersonCode: Code[20];
        WonLostStatusInteger: Integer;
    begin
        SalespersonCode := CopyStr(QuoteNotification.GetData('SalespersonCode'), 1, MaxStrLen(SalespersonCode));
        Evaluate(WonLostStatusInteger, QuoteNotification.GetData('WonLostStatus'));
        WonLostStatus := "Won/Lost Status".FromInteger(WonLostStatusInteger);

        FilterQuotes(SalesHeader, WonLostStatus, SalespersonCode);
        if SalesHeader.FindSet() then
            Page.Run(Page::"Sales Quotes", SalesHeader);
    end;

    local procedure FilterQuotes(var SalesHeader: Record "Sales Header"; WonLostStatus: Enum "Won/Lost Status"; SalespersonCode: Code[20])
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Quote);
        SalesHeader.SetRange("Salesperson Code", SalespersonCode);
        SalesHeader.SetRange("Won/Lost Quote Status", WonLostStatus);
        SalesHeader.SetRange("Won/Lost Date", AddDaysToDateTime(CurrentDateTime(), -5), CurrentDateTime());
    end;
}