//9 - Ler um valor e escrever se é positivo, negativo ou zero

#INCLUDE 'TOTVS.CH'

User Function Ex009()
    Local cValor := ''

    cValor := FwInputBox('Insira aqui um número', cValor)

    If Val(cValor) > 0
        FwAlertInfo('O valor inserido é positivo')
    Elseif Val(cValor) < 0
        FwAlertInfo('O valor inserido é negativo')
    Else
        FwAlertInfo('O valor inserido é zero')
    ENDIF
Return
