page 50103 "Egg Types"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = EggType;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("code"; Rec."code")
                {
                    ToolTip = 'Specifies the value of the Code. field.';
                }
                field(description; Rec.description)
                {
                    ToolTip = 'Specifies the value of the Description. field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(InsertDefaultEggTypes)
            {
                ApplicationArea = All;
                ToolTip = 'Insert default egg types.';
                Image = Add;
                trigger OnAction()
                var
                    EggType: Record EggType;
                    EggTypeNotEmptyErr: Label 'There are already Egg Types in the table.';
                begin
                    if EggType.IsEmpty then begin
                        EggType.InsertEggType('EGG002', 'Egg type 2.');
                        EggType.InsertEggType('EGG003', 'Egg type 3.');
                        EggType.InsertEggType('EGG004', 'Egg type 4.');
                    end
                    else
                        Error(EggTypeNotEmptyErr);
                end;
            }
        }
    }
}