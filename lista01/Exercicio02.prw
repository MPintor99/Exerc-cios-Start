//� 2 - Escreva um algoritmo para ler as dimens�es de um ret�ngulo (base e altura), calcular e escrever a �rea desse ret�ngulo.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function Ex002()

    local cBase     := ''
    local cAltura   := ''
    local nArea     := 0

    cBase := FwInputBox('Digite o tamanho da base do ret�ngulo em cent�metros', cBase)

    While !EHNUMERO(cBase)// Valida��o de entrada que determina se � um n�mero, seja ele positivo ou negativo.
        FwAlertError('Voc� n�o colocou um n�mero' , 'Error')
        cBase := FwInputBox('Digite o tamanho da base do ret�ngulo em cent�metros', cBase)
    End

    cAltura := FwInputBox('Digite o tamanho da altura do ret�ngulo em cent�metros', cAltura)

    While !EHNUMERO(cAltura)// Valida��o de entrada que determina se � um n�mero, seja ele positivo ou negativo.
        FwAlertError('Voc� n�o colocou um n�mero' , 'Error')
        cAltura := FwInputBox('Digite o tamanho da altura do ret�ngulo em cent�metros', cAltura)
    End

    nArea := (Val(cBase) * Val(cAltura))

    FwAlertSuccess('A �rea do ret�ngulo �: ' + cValToChar(nArea) + 'cm�' , '�rea ret�ngulo')

Return
