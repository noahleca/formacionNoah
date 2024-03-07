codeunit 50100 "Json Guide"
{
    /*Seria en mi caso User2Json, por No. que es un integer.*/
    procedure Job2Json(JobNo: Code[20]): JsonObject
    var
        Job: Record Job;
        JO: JsonObject;
    begin
        Job.Get(JobNo);
        JO.Add('JobNo', Job."No.");
        JO.Add('Tasks', Tasks2Json(Job."No."));
        exit(JO);
    end;

    procedure Tasks2Json(JobNo: Code[20]): JsonArray
    var
        Task: Record "Job Task";
        JA: JsonArray;
        Tools: Codeunit "Json Tools";
    begin
        Task.SetRange("Job No.", JobNo);
        if Task.FindSet() then
            repeat
                JA.Add(Tools.Rec2Json(Task));
            until Task.Next() = 0;
        exit(JA);
    end;

    procedure UserMGS2Json(No: Integer): JsonObject
    var
        UserMGS: Record "User MGS Table";
        JO: JsonObject;
    begin
        UserMGS.Get(No);
        JO.Add('Name', UserMGS.Name);
        JO.Add('Email', UserMGS.Email);
        exit(JO);
    end;
}