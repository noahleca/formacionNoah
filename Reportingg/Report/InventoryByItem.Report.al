report 50100 InventoryByItem
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Inventory By Item Report';
    RDLCLayout = './src/InventoryByItem.rdl';
    WordLayout = './src/InventoryByItem.docx';
    DefaultLayout = Word;



    dataset
    {
        dataitem(Item; Item)
        {
            column(ItemNo; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Inventory; Inventory)
            {
                IncludeCaption = true;
            }
        }
    }
}