permissionset 50100 ChickenManagement
{
    Assignable = true;
    Caption = 'ChickenManagement', MaxLength = 30;
    Permissions =
        table "Egg Production Header" = X,
        tabledata "Egg Production Header" = RMID,
        table "Egg Production Line" = X,
        tabledata "Egg Production Line" = RMID,
        table EggType = X,
        tabledata EggType = RMID,
        table ChickenType = X,
        tabledata ChickenType = RMID,
        table Chicken = X,
        tabledata Chicken = RMID,
        codeunit Install = X,
        page "Chicken Card" = X,
        page ChickenList = X,
        page "Egg Production Document" = X,
        page "Egg Production Line Page" = X,
        page "Egg Production List" = X,
        page "Egg Production Subpage" = X,
        page "Egg Types" = X,
        page "Chicken Types List" = X,
        page "Chicken Management Rolecenter" = X;
}
