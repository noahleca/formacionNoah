page 50101 "Sincronizacion List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Sincronizacion Table";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Rec.Id)
                {
                    ToolTip = 'Specifies the id of the record.';
                    Caption = 'Id';
                }
                field(Direction; Rec.Direction)
                {
                    ToolTip = 'Specifies the direction of the record.';
                    Caption = 'Direction';
                }
                field(Action; Rec.Action)
                {
                    ToolTip = 'Specifies the action of the record.';
                    Caption = 'Action';
                }
                field(Data; DataText)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetDataTextContent();
                    end;

                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the status of the record.';
                    Caption = 'Status';
                }
                field("Error"; ErrorText)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        SetErrorTextContent();
                    end;
                }
            }
        }

    }
    var
        DataText: Text;
        ErrorText: Text;

    trigger OnOpenPage()
    begin
        HttpRequest();
    end;

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

    [IntegrationEvent(true, false)]
    procedure OnAfterInsert()
    begin

    end;

    local procedure ProcessJO(JT: JsonToken)
    var
        JO2: JsonObject;
        JT2: JsonToken;
        JK: Text;
        OK: List of [Text];
        Users: Record "Sincronizacion Table";
        IsInserted: Boolean;
        Direction: Enum "Direction Enum";
        Action: Enum "Action Enum";
        Status: Enum "Status Enum";
        OS: OutStream;
    begin
        JO2 := JT.AsObject;
        JO2.WriteTo(JK);
        Users.Init();
        Users.Direction := Direction::"In";
        Users.Action := Action::"Update User";
        Users.Data.CreateOutStream(OS);
        OS.WriteText(JK);
        Users.Status := Status::Success;
        Users.Insert();
    end;

    trigger OnAfterGetRecord()
    begin
        GetDataTextContent();
        GetErrorTextContent();
    end;

    local procedure SetDataTextContent()
    var
        OutStream: OutStream;
    begin
        Rec.Data.CreateOutStream(OutStream);
        OutStream.Write(DataText);
        Rec.Modify(true)
    end;

    local procedure GetDataTextContent()
    var
        InStream: InStream;
    begin
        Rec.CalcFields(Data);
        Rec.Data.CreateInStream(InStream);
        InStream.Read(DataText);
    end;

    local procedure SetErrorTextContent()
    var
        OutStream: OutStream;
    begin
        Rec.Error.CreateOutStream(OutStream);
        OutStream.Write(ErrorText);
        Rec.Modify(true)
    end;

    local procedure GetErrorTextContent()
    var
        InStream: InStream;
    begin
        Rec.CalcFields(Error);
        Rec.Error.CreateInStream(InStream);
        InStream.Read(ErrorText);
    end;
}