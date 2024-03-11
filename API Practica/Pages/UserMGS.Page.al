page 50100 "User MGS List"
{
    PageType = List;
    Caption = 'User MGS';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "User MGS Table";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the number of the record.';
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the name of the record.';
                }
                field(Email; Rec.Email)
                {
                    Caption = 'Email';
                    ToolTip = 'Specifies the email of the record.';
                }
                field("External Id"; Rec."External Id")
                {
                    Caption = 'External Id';
                    ToolTip = 'Specifies the external id of the record.';
                }
            }
        }

    }
    actions
    {
        area(Creation)
        {
            group(Create)
            {
                action("Update Users")
                {
                    Caption = 'eEgg types.';
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        Sync: Record "Sincronizacion Table";
                        IS: InStream;
                        JA: JsonObject;
                        JT: JsonToken;
                        R: Text;
                    begin
                        if (Sync.FindSet) then
                            repeat
                                Sync.CalcFields(Sync.Data);
                                Sync.Data.CreateInStream(IS);
                                IS.Read(R);
                                JA.ReadFrom(R);
                                ProcessJO(JA);
                            until (Sync.Next = 0);
                    end;
                }
            }
        }
    }
    /*trigger OnOpenPage()
    begin
        HttpRequest();
    end;*/
    procedure HttpRequest()
    var
        HC: HttpClient;
        HRC: HttpResponseMessage;
        URL: Label 'http://192.168.87.66:3000/user';
        R: Text;
        JO: JsonObject;
        JA: JsonArray;
        JT: JsonToken;
        JOK: List of [JsonToken];
        Tools: Codeunit "JSON Tools";
    begin
        if HC.Get(URL, HRC) then begin
            HRC.Content.ReadAs(R);
            JA.ReadFrom(R);
            foreach JT in JA do begin
                ProcessJO(JT);
            end;
        end;
    end;


    local procedure ProcessJO(JO: JsonObject)
    var
        JK: Text;
        OK: List of [Text];
        JT: JsonToken;
        Users: Record "User MGS Table";
        IsInserted: Boolean;
    begin
        OK := JO.Keys;
        foreach JK in OK do begin
            JO.Get(JK, JT);
            if JT.IsValue then begin
                case JK of
                    'id':
                        begin
                            Users.SetRange("External Id", JT.AsValue().AsText());
                            if Users.IsEmpty() then begin
                                Users.Init();
                                Users."External Id" := JT.AsValue().AsText();
                            end
                            else begin
                                IsInserted := true;
                                break;
                            end;
                        end;
                    'name':
                        Users.Name := JT.AsValue().AsText();
                    'email':
                        Users.Email := JT.AsValue().AsText();
                    'updateAt':
                        ;
                    'updateBy':
                        ;
                end;
            end;
        end;
        if IsInserted = false then
            Users.Insert();
    end;

    local procedure ProcessJO(JT: JsonToken)
    var
        JO2: JsonObject;
        JT2: JsonToken;
        JK: Text;
        OK: List of [Text];
        Users: Record "User MGS Table";
        IsInserted: Boolean;
    begin
        JO2 := JT.AsObject();
        OK := JO2.Keys;
        foreach JK in OK do begin
            JO2.Get(JK, JT2);
            if JT2.IsValue then begin
                case JK of
                    'id':
                        begin
                            Users.SetRange("External Id", JT2.AsValue().AsText());
                            if Users.IsEmpty() then begin
                                Users.Init();
                                Users."External Id" := JT2.AsValue().AsText();
                            end
                            else begin
                                IsInserted := true;
                                break;
                            end;
                        end;
                    'name':
                        Users.Name := JT2.AsValue().AsText();
                    'email':
                        Users.Email := JT2.AsValue().AsText();
                    'updateAt':
                        ;
                    'updateBy':
                        ;
                end;
            end;

        end;
        if IsInserted = false then
            Users.Insert();
    end;
}