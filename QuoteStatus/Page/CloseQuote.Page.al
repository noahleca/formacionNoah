page 50100 "Close Quote"
{
    Caption = 'Close Quote';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Sales Header";

    layout
    {
        area(Content)
        {
            group(Groupname)
            {
                Caption = 'General';
                field("Quote Won"; Rec."Won/Lost Quote Status")
                {
                    ApplicationArea = All;
                    Editable = AllowChangeStatus;
                    ToolTip = 'Specifies the status of the quote.';
                }
                field("Won/Lost Date"; Rec."Won/Lost Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specified the data this quote was closed.';
                }
                field("Won/Lost Reason"; Rec."Won/Lost Reason Code")
                {
                    ApplicationArea = All;
                    Editable = AllowChangeStatus;
                    ToolTip = 'Specifies the reason closing the quote.';
                }
                field("Won/Lost Reason Desc."; Rec."Won/Lost Reason Desc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the reason closing the quote.';
                }
                field("Won/Lost Remarks"; Rec."Won/Lost Remarks")
                {
                    Caption = 'Remarks';
                    ApplicationArea = All;
                    MultiLine = true;
                    Editable = AllowChangeStatus;
                    ToolTip = 'Specifies an extra remark on the quote status.';
                }
            }
        }
    }
    var
        AllowChangeStatus: Boolean;

    trigger OnOpenPage()
    begin
        AllowChangeStatus := Rec."Won/Lost Quote Status" <> Rec."Won/Lost Quote Status"::"Won";
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = Action::LookupOK then
            FinishWizard();
    end;

    local procedure FinishWizard()
    var
        MustSelectWonOrLostErr: Label 'You must select either Won or Lost.';
        FieldMustBeFilledInErr: Label 'You must fill in the % field.', Comment = '%1 = caption of the field.';
    begin
        if not (Rec."Won/Lost Quote Status" in [Rec."Won/Lost Quote Status"::Won, Rec."Won/Lost Quote Status"::Lost]) then
            Error(MustSelectWonOrLostErr);
        if Rec."Won/Lost Reason Code" = '' then
            Error(FieldMustBeFilledInErr, Rec.FieldCaption("Won/Lost Reason Code"));
        Rec.Modify();
    end;
}