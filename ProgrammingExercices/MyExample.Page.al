page 55100 MyExamplePage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'MyExamplePage';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(FirstValue; FirstValue)
                {
                    ApplicationArea = All;
                }
                field(SecondValue; SecondValue)
                {
                    ApplicationArea = All;
                }
            }
            group(Output)
            {
                Caption = 'Output';
                group(Resultado)
                {
                    field(Result; Result)
                    {
                        ApplicationArea = All;
                    }
                }
                group(BiggerOrSmaller)
                {
                    field(IsBigger; IsBigger)
                    {
                        ApplicationArea = All;
                    }
                    field(IsSmaller; IsSmaller)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Plus)
            {
                ApplicationArea = All;
                Caption = '+';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := FirstValue + SecondValue;
                end;
            }
            action(Minus)
            {
                ApplicationArea = All;
                Caption = '-';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := FirstValue - SecondValue;
                end;
            }
            action(Multiply)
            {
                ApplicationArea = All;
                Caption = '*';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := FirstValue * SecondValue;
                end;
            }
            action(Divide)
            {
                ApplicationArea = All;
                Caption = '/';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := FirstValue / SecondValue;
                end;
            }
            action(BiggerThan)
            {
                ApplicationArea = All;
                Caption = '>';
                Image = Calculate;

                trigger OnAction()
                begin
                    if FirstValue > SecondValue then
                        Result := FirstValue;
                    if SecondValue > FirstValue then
                        Result := SecondValue;
                end;
            }
            action(SmallerThan)
            {
                ApplicationArea = All;
                Caption = '<';
                Image = Calculate;

                trigger OnAction()
                begin
                    if FirstValue < SecondValue then
                        Result := FirstValue;
                    if SecondValue < FirstValue then
                        Result := SecondValue;
                end;
            }
            action(IntegerDivide)
            {
                ApplicationArea = All;
                Caption = '_DIV';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := FirstValue div SecondValue;
                end;
            }
            action(Modulus)
            {
                ApplicationArea = All;
                Caption = '_MOD';
                Image = Calculate;

                trigger OnAction()
                begin
                    Result := FirstValue mod SecondValue;
                end;
            }
        }
    }

    var
        FirstValue, SecondValue, Result : integer;
        IsBigger, IsSmaller : boolean;
}