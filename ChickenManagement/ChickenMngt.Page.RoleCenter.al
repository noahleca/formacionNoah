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
        area(Creation)
        {
            action(ActionBarAction)
            {
                Caption = 'Action bar action.';
                ApplicationArea = All;
                RunObject = Page "Chicken Management Rolecenter";
            }
        }
        area(Sections)
        {
            group(SectionsGroupName)
            {
                action(SectionsAction)
                {
                    Caption = 'Sections action.';
                    ApplicationArea = All;
                    RunObject = Page "Chicken Management Rolecenter";
                }
            }
            group(MasterData)
            {
                action(ChickenList)
                {
                    Caption = 'Chicken list.';
                    ApplicationArea = All;
                    RunObject = Page "Chicken Management Rolecenter";
                }
                action(ChickenTypes)
                {
                    Caption = 'Chicken types.';
                    ApplicationArea = All;
                    RunObject = Page "Chicken Management Rolecenter";
                }
            }
            group(Documents)
            {
                action(EggProduction)
                {
                    Caption = 'Egg production.';
                    ApplicationArea = All;
                    RunObject = Page "Chicken Management Rolecenter";
                }
                action(EggTypes)
                {
                    Caption = 'Egg types.';
                    ApplicationArea = All;
                    RunObject = Page "Chicken Management Rolecenter";
                }
            }
        }
        area(Embedding)
        {
            action(EmbeddingAction)
            {
                Caption = 'Embedding action.';
                ApplicationArea = All;
                RunObject = Page "Chicken Management Rolecenter";
            }
            action(eChickenList)
            {
                Caption = 'eChicken list.';
                ApplicationArea = All;
                RunObject = Page "Chicken Management Rolecenter";
            }
            action(eChickenTypes)
            {
                Caption = 'eChicken types.';
                ApplicationArea = All;
                RunObject = Page "Chicken Management Rolecenter";
            }
            action(eEggProduction)
            {
                Caption = 'eEgg production.';
                ApplicationArea = All;
                RunObject = Page "Chicken Management Rolecenter";
            }
            action(eEggTypes)
            {
                Caption = 'eEgg types.';
                ApplicationArea = All;
                RunObject = Page "Chicken Management Rolecenter";
            }
        }
    }
}