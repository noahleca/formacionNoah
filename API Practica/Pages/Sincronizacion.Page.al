page 50101 "Sincronizacion List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sincronizacion Table";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Direction; Rec.Direction)
                {
                    ToolTip = 'Specifies the direction of the record.';
                    Caption = 'Direction';
                }
                field(Action; Rec.Action)
                {
                    ToolTip = 'Specifies the action of the record.';
                    Caption = 'Action';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the status of the record.';
                    Caption = 'Status';
                }
                field(Error; Rec.Error)
                {
                    ToolTip = 'Specifies the error of the record.';
                    Caption = 'Error';
                }
            }
        }
    }
}