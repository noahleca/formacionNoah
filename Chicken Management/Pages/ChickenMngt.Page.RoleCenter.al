page 50108 "Chicken Management Rolecenter"
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(HeadLineOrderProcessor; "Headline RC Order Processor")
            {
                ApplicationArea = All;
            }
            part(O365CustomerActivity; "O365 Customer Activity Page")
            {
                ApplicationArea = All;
            }
            part(O365Activities; "O365 Activities")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(MasterData)
            {
                Caption = 'Master data.';
                Image = RegisteredDocs;
                action(ChickenList)
                {
                    Caption = 'Chicken list.';
                    ApplicationArea = All;
                    RunObject = Page ChickenList;
                }
                action(ChickenTypes)
                {
                    Caption = 'Chicken types.';
                    ApplicationArea = All;
                    RunObject = Page "Chicken Types List";
                }
            }
            group(Documents)
            {
                Caption = 'Documents.';
                Image = List;
                action(EggProduction)
                {
                    Caption = 'Egg production.';
                    ApplicationArea = All;
                    RunObject = Page "Egg Production List";
                }
                action(EggTypes)
                {
                    Caption = 'Egg types.';
                    ApplicationArea = All;
                    RunObject = Page "Egg Types";
                }
            }
        }
        area(Embedding)
        {
            action(eChickenList)
            {
                Caption = 'eChicken list.';
                ApplicationArea = All;
                RunObject = Page ChickenList;
            }
            action(eChickenTypes)
            {
                Caption = 'eChicken types.';
                ApplicationArea = All;
                RunObject = Page "Chicken Types List";
            }
            action(eEggProduction)
            {
                Caption = 'eEgg production.';
                ApplicationArea = All;
                RunObject = Page "Egg Production List";
            }
            action(eEggTypes)
            {
                Caption = 'eEgg types.';
                ApplicationArea = All;
                RunObject = Page "Egg Types";
            }
        }
    }
}