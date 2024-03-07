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
    procedure HttpRequest()
    var
        HC: HttpClient;
        HRC: HttpResponseMessage;
        URL: Label 'http://192.168.87.56:3000/user';
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
                //Message(Format(JT));
            end;
        end;
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

    trigger OnOpenPage()
    begin
        HttpRequest();
    end;
}