page 55113 "Example Card"
{
    ApplicationArea = All;
    Caption = 'Example Card';
    PageType = Card;
    SourceTable = Example;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(FieldOne; Rec.FieldOne)
                {
                    ToolTip = 'Specifies the value of the Field One field.';
                    trigger OnValidate()
                    begin
                        TriggerLog.InsertLogEntry('Page Example Card', 'OnValidate Field One');
                    end;
                }
                field(FieldTwo; Rec.FieldTwo)
                {
                    ToolTip = 'Specifies the value of the Field Two field.';
                    trigger OnValidate()
                    begin
                        TriggerLog.InsertLogEntry('Page Example Card', 'OnValidate Field Two');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnAfterGetCurrRecord');
    end;

    trigger OnAfterGetRecord()
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnAfterGetRecord');
    end;

    trigger OnClosePage()
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnClosePage');
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnDeleteRecord');
    end;

    trigger OnModifyRecord(): Boolean
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnModifyRecord');
    end;

    trigger OnInit()
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnInit');
    end;

    trigger OnInsertRecord(BelowRec: Boolean): Boolean
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnInsertRecord');
    end;

    trigger OnNewRecord(BelowRec: Boolean)
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnNewRecord');
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnFindRecord');
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnNextRecord');
    end;

    trigger OnOpenPage()
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnOpenPage');
    end;

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [text, text])
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnPageBackgroundTaskCompleted');
    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var isHandled: Boolean)
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnPageBackgroundTaskError');
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        TriggerLog.InsertLogEntry('Page Example Card', 'OnQueryClosePage');
    end;

    var
        TriggerLog: Record TriggerLog;
}