page 2 "Role Center Page 2"
{
    PageType = RoleCenter;
    Caption = 'Role Center Page 2';

    layout
    {
        area(sections)
        {
            group(Action39)
            {
                Caption = 'Finance';
                Image = Journals;
                action (GeneralJournals)
                {
                    Caption = 'General Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(General),
                                        Recurring = const(false));
                }
                action (Action3)
                {
                    Caption = 'Chart of Accounts';
                    RunObject = Page "Chart of Accounts";
                }
                action ("G/L Account Categories")
                {
                    Caption = 'G/L Account Categories';
                    RunObject = Page "G/L Account Categories";
                }
                action ("G/L Budgets")
                {
                    Caption = 'G/L Budgets';
                    RunObject = Page 'G/L Budget Names';
                }
                // ...
            }
            group ("Cash Management")
            {
                Caption = 'Cash Management';
                // ...
            }
            group (Action40)
            {
                Caption = '';
                // ...
            }
        }
    }
}