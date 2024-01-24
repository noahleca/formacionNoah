page 55109 "MyDevCustomer List"
{
    PageType = ListPlus;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = MyDevCustomer;
    Editable = true;
    CardPageId = "MyDevCustomer Card";
    Caption = 'MyDevCustomer List';

    layout
    {
        area(Content)
        {
            group(Entrada)
            {
                field(TextEntrada; entrada)
                {
                    Caption = 'Entrada';
                    ToolTip = 'Entrada';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        ValidateSearchString();
                    end;
                }
            }
            repeater(GroupName)
            {
                Editable = false;
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer No.';
                }
                field(Nombre; rec.Nombre)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Nombre';
                }
                field(Ciudad; rec.Ciudad)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Ciudad';
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
                Image = Copy;
                trigger OnAction();
                var
                    CustomerRec: Record Customer;
                    FilteredCustomerRec: Record MyDevCustomer;
                begin
                    ValidateSearchString();
                    Clear(FilteredCustomerRec);
                    Clear(CustomerRec);
                    CustomerRec.SetFilter(City, '%1', entrada);

                    if CustomerRec.FindSet() then
                        repeat
                            if FilteredCustomerRec.Get(CustomerRec."No.") then
                                exit;
                            FilteredCustomerRec."No." := CustomerRec."No.";
                            FilteredCustomerRec.Nombre := CustomerRec.Name;
                            FilteredCustomerRec.Ciudad := CustomerRec.City;
                            FilteredCustomerRec.Insert();
                        until CustomerRec.Next() = 0
                    else
                        Message('No se han encontrado clientes disponibles con estos criterios de busqueda.');
                    CurrPage.Update();
                end;
            }
            action(EmptyTable)
            {
                ApplicationArea = All;
                Caption = 'Empty table';
                ToolTip = 'Empty table';
                Image = ClearLog;
                trigger OnAction()
                var
                    MyDevCustomerRec: Record MyDevCustomer;
                begin
                    Clear(MyDevCustomerRec);
                    if not Confirm('Estás seguro?') then
                        exit;

                    MyDevCustomerRec.DeleteAll();
                    CurrPage.Update();
                end;
            }
        }
    }
    var
        entrada: Text;

    trigger OnOpenPage()
    begin
        Clear(entrada);
    end;

    local procedure ValidateSearchString()
    begin
        if not entrada.Contains('*') then
            Error('El parametro de entrada deberia contener un *.')
    end;
}