page 55104 "Numeros Armstrong"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Consigue los numeros Armstrong.';

    layout
    {
        area(Content)
        {
            group(Information)
            {
                Caption = 'Introduce un numero de inicio y de fin:';
                field(NumeroInicio; NumeroInicio)
                {
                    ApplicationArea = All;
                    Caption = 'Numero de inicio';
                    ToolTip = 'Numero de inicio';
                }
                field(NumeroFin; NumeroFin)
                {
                    ApplicationArea = All;
                    Caption = 'Numero de fin';
                    ToolTip = 'Numero de fin';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ConsigueNumerosArmstrong)
            {
                Caption = 'Consigue los numeros Armstrong';
                ToolTip = 'Consigue los numeros Armstrong';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = Find;

                trigger OnAction()
                var
                    Armstrong: Codeunit Armstrong;
                begin
                    if (NumeroInicio = 0) or (NumeroFin = 0) then exit;
                    Message(Armstrong.EncuentraTodosLosNumerosArmstrong(NumeroInicio, NumeroFin));
                end;
            }
        }
    }

    var
        NumeroInicio: Integer;
        NumeroFin: Integer;
}

codeunit 55102 Armstrong
{
    procedure EncuentraTodosLosNumerosArmstrong(NumeroInicio: Integer; NumeroFin: Integer): Text
    var
        NumeroActual: Integer;
        NumerosArmstrong: Text;
        Dialogo: Dialog;
    begin
        Clear(NumerosArmstrong);
        Dialogo.Open('#1###########################\\' + '#2###################################');
        Dialogo.Update(1, 'Espere...');
        for NumeroActual := NumeroInicio to NumeroFin do begin
            Dialogo.Update(2, NumeroActual);
            //Sleep(100);
            if EsArmstrong(NumeroActual) then
                NumerosArmstrong += Format(NumeroActual) + '\';
        end;
        Dialogo.Close();
        exit(NumerosArmstrong);
    end;

    local procedure EsArmstrong(NumeroActual: Integer): Boolean
    var
        PosicionUltimoDigito: Integer;
        TextoPotencia: Text;
        Potencia: Integer;
        PosicionDigitoIndividual: Integer;
        DigitoIndividual: Integer;
        TextoDigitoIndividual: Text;
        ResultadoTemporal: Integer;
    begin
        PosicionUltimoDigito := StrLen(Format(NumeroActual));
        TextoPotencia := CopyStr(Format(NumeroActual), PosicionUltimoDigito, 1);
        Evaluate(Potencia, TextoPotencia);
        for PosicionDigitoIndividual := 1 to StrLen(Format(NumeroActual)) do begin
            TextoDigitoIndividual := CopyStr(Format(NumeroActual), PosicionDigitoIndividual, 1);
            Evaluate(DigitoIndividual, TextoDigitoIndividual);
            ResultadoTemporal += Power(DigitoIndividual, Potencia);
        end;
        if ResultadoTemporal = NumeroActual then
            exit(true);
        Clear(ResultadoTemporal);
    end;

}