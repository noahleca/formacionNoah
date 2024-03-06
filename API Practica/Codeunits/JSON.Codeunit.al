/*
AL Language extension for Microsoft Dynamics 365 Business Central
AL Object Designer
AZ AL Dev Tool
https://businesscentralgeek.com/json-full-guide-in-business-central#:~:text=In%20Business%20Central%2C%20a%20JSON,reading%20data%20from%20a%20JSON
*/
codeunit 50115 "JSON Full Guide"
{
    /*
    JSON data types.
    */
    procedure CreateSimplestJSON()
    var
        JsonObject: JsonObject;
    begin
        JsonObject.Add('Name', 'John');
        Message(Format(JsonObject));
    end;

    procedure CreateSimplestJSONWithArray()
    var
        JsonArray: JsonArray;
        JsonObject: JsonObject;
    begin
        JsonArray.Add('Spanish');
        JsonArray.Add('English');

        JsonObject.Add('Name', 'John');
        JsonObject.Add('Languages', JsonArray);

        Message(Format(JsonObject));
    end;

    /*
    How to create a JSON.
    */
    procedure CreateJSONOrder(SalesHeader: Record "Sales Header")
    var
        HeaderJsonObject: JsonObject;
        LineJsonObject: JsonObject;
        JsonArray: JsonArray;
        SalesLine: Record "Sales Line";
    begin
        HeaderJsonObject.Add('Document Type', SalesHeader."Document Type".AsInteger());
        HeaderJsonObject.Add('No.', SalesHeader."No.");
        HeaderJsonObject.Add('Sell-to Customer No.', SalesHeader."Sell-to Customer No.");
        HeaderJsonObject.Add('Posting Date', SalesHeader."Posting Date");

        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindSet() then
            repeat
                Clear(LineJsonObject);
                LineJsonObject.Add('Line No.', SalesLine."Line No.");
                LineJsonObject.Add('', SalesLine.Type.AsInteger());
                LineJsonObject.Add('', SalesLine."No.");
                LineJsonObject.Add('', SalesLine.Quantity);
                LineJsonObject.Add('', SalesLine."Unit Price");
                JsonArray.Add(LineJsonObject);
            until SalesLine.Next() = 0;
        HeaderJsonObject.Add('Lines', JsonArray);
    end;

    /*
    How to read a JSON.
    */
    procedure ReadComplexJSON(JsonString: Text)
    var
        JsonResponse: JsonObject;
        JsonOrder: JsonObject;
        JsonTokenValue: JsonToken;
    begin
        if JsonResponse.ReadFrom(JsonString) then begin
            JsonResponse.Get('data', JsonTokenValue);

            JsonOrder := JsonTokenValue.AsObject();
            JsonOrder.Get('Document Type', JsonTokenValue);

            JsonTokenValue.AsObject().Get('', JsonTokenValue)
        end;
    end;
}