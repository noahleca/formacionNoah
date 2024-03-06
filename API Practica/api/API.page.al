page 50103 "API Practica"
{
    PageType = API;
    APIVersion = 'v1.0';
    APIPublisher = 'mitra';
    APIGroup = 'sales';
    EntityName = 'user';
    EntitySetName = 'users';
    SourceTable = "User MGS Table";
    DelayedInsert = true;
    ODataKeyFields = "External Id";
    InsertAllowed = true;
    DeleteAllowed = true;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.', Comment = 'ESP="No."';
                }
                field(name; Rec.Name)
                {
                    Caption = 'Name', Comment = 'ESP="Name"';
                }
                field(email; Rec.Email)
                {
                    Caption = 'Email', Comment = 'ESP="Email"';
                }
                field(externalid; Rec."External Id")
                {
                    Caption = 'External', Comment = 'ESP="External"';
                }
            }
        }
    }
}