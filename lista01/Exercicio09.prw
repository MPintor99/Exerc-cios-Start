//9 - Ler um valor e escrever se � positivo, negativo ou zero

#INCLUDE 'TOTVS.CH'

User Function Ex009()
    Local cValor := ''

    cValor := FwInputBox('Insira aqui um n�mero', cValor)

    If Val(cValor) > 0
        FwAlertInfo('O valor inserido � positivo')
    Elseif Val(cValor) < 0
        FwAlertInfo('O valor inserido � negativo')
    Else
        FwAlertInfo('O valor inserido � zero')
    ENDIF
Return
