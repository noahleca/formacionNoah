report 50107 "Update Item Description"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Update Item Description';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterHeading = 'Item Seelection';
            RequestFilterFields = "No.", Description, "Description 2";
            trigger OnPreDataItem()
            begin
                Clear(Counter);
            end;

            trigger OnAfterGetRecord()
            var
                ItemToUpdate: Record Item;
            begin
                Clear(ItemToUpdate);
                if ItemToUpdate.Get(Item."No.") then begin
                    ItemToUpdate."Description 2" := CopyStr(Description + ' (' + ItemToUpdate."No." + ')', 1, MaxStrLen(ItemToUpdate."Description 2"));
                    ItemToUpdate.Modify();
                    Counter += 1;
                end;
            end;

            trigger OnPostDataItem()
            begin
                Message('Updated %1 items', Counter)
            end;
        }
    }
    var
        Counter: Integer;
}