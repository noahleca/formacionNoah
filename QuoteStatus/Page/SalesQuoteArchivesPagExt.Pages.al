pageextension 50102 "Sales Quote Archives Extension" extends "Sales Quote Archives"
{
    layout
    {
        addlast(Control1)
        {
            field("Won/Lost Quote Status"; "Won/Lost Quote Status")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Won/Lost Quote Status';
            }
            field("Won/Lost Date"; "Won/Lost Date")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Won/Lost Date';
            }
            field("Won/Lost Reason Code"; "Won/Lost Reason Code")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Won/Lost Reason Code';
            }
            field("Won/Lost Reason Desc."; "Won/Lost Reason Desc.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Won/Lost Reason Desc.';
            }
            field("Won/Lost Remarks"; "Won/Lost Remarks")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Won/Lost Remarks';
            }
        }
    }   
        keys
        {
            key(Key1; MyField)
            {
                Clustered = true;
            }
        }
        
        fieldgroups
        {
            // Add changes to field groups here
        }
        
        var
            myInt: Integer;
        
        trigger OnInsert()
        begin
            
        end;
        
        trigger OnModify()
        begin
            
        end;
        
        trigger OnDelete()
        begin
            
        end;
        
        trigger OnRename()
        begin
            
        end;
        
    }

    var
        "Won/Lost Quote Status": Enum "Won/Lost Status";
        "Won/Lost Date": DateTime;
        "Won/Lost Reason Code": Code[10];
        "Won/Lost Reason Desc.": Text[100];
        "Won/Lost Remarks": Text[2048];
}