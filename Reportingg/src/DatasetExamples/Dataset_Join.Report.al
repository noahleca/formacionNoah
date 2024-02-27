report 50104 Dataset_Join
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'src/DatasetExamples/Dataset_Join.rdl';

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            PrintOnlyIfDetail = true;
            column(No_Vendor; "No.")
            { }
            column(Name_Vendor; Name)
            { }

            dataitem("Vendor Ledger Entry"; "Vendor Ledger Entry")
            {
                DataItemLink = "Vendor No." = field("No.");
                column(VendorNo_VendorLedgerEntry; "Vendor No.")
                { }
                column(PostingDate_VendorLedgerEntry; "Posting Date")
                { }
                column(Amount_VendorLedgerEntry; Amount)
                { }
            }
        }
    }
}