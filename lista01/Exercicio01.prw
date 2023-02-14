//� 1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function Ex001()

    local nMSG := ''
    local nNum := 0

    nMSG := FwInputBox('Qual n�mero voc� deseja saber o antecessor?', nMSG)

    While !EHNUMERO(nMSG)// Valida��o de entrada que determina se � um n�mero, seja ele positivo ou negativo.
        FwAlertError('Voc� n�o colocou um n�mero' , 'Error')
        nMSG := FwInputBox('Qual n�mero voc� deseja saber o antecessor?', nMSG)
    End
    nNum := (Val(nMSG) - 1)
    FwAlertSuccess('O antecessor do n�mero digitado �: ' + cValToChar(nNum) , 'Antecessor')

Return
