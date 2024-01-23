table 55100 MyDevCustomer
{
    DataClassification = CustomerContent;
    Caption = 'MyDevCustomer';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Nombre"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Nombre';
        }
        field(3; "Ciudad"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Ciudad';
        }
    }

    keys
    {
        key(key1; "No.")
        {
            Clustered = true;
        }
    }
}

page 55109 "MyDevCustomer List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = MyDevCustomer;

    layout
    {
        area(Content)
        {
            group(Entrada)
            {
                field(TextEntrada; entrada)
                {
                    ApplicationArea = All;
                    Caption = 'Entrada';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CopyFromCustomer)
            {
                ApplicationArea = All;
                Caption = 'Copy from customer';
                ToolTip = 'Copy from customer';
                trigger OnAction();
                var
                    CustomerRec: Record Customer;
                    FilteredCustomerRec: Record MyDevCustomer;
                begin
                    if STRPOS(entrada, '*') = 0 then begin
                        Error('El parametro de busqueda debe contener el caracter: *.');
                    end;
                    CustomerRec.Reset;
                    FilteredCustomerRec.Reset();
                    FilteredCustomerRec.SetRange("Ciudad", entrada);

                    while CustomerRec.FindSet() do begin
                        FilteredCustomerRec.SetRange("Ciudad", '%' + entrada + '%');
                        if not FilteredCustomerRec.Find('-') then begin
                            FilteredCustomerRec.Init();
                            FilteredCustomerRec."No." := CustomerRec."No.";
                            FilteredCustomerRec.Nombre := CustomerRec.Name;
                            FilteredCustomerRec.Ciudad := CustomerRec.City;
                            FilteredCustomerRec.Insert(true);
                        end;
                    end;
                    Update(true);
                end;
            }
            action(EmptyTable)
            {
                ApplicationArea = All;
                Caption = 'Empty table';
                ToolTip = 'Empty table';
                trigger OnAction()
                var
                    MyDevCustomerRec: Record MyDevCustomer;
                begin
                    MyDevCustomerRec.Reset();
                    MyDevCustomerRec.DeleteAll();

                    Update(true);
                end;
            }
        }
    }
    var
        entrada: Text;
}