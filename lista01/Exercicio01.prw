//• 1 - Escreva um algoritmo para ler um valor e escrever o seu antecessor.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function Ex001()

    local nMSG := ''
    local nNum := 0

    nMSG := FwInputBox('Qual número você deseja saber o antecessor?', nMSG)

    While !EHNUMERO(nMSG)// Validação de entrada que determina se é um número, seja ele positivo ou negativo.
        FwAlertError('Você não colocou um número' , 'Error')
        nMSG := FwInputBox('Qual número você deseja saber o antecessor?', nMSG)
    End
    nNum := (Val(nMSG) - 1)
    FwAlertSuccess('O antecessor do número digitado é: ' + cValToChar(nNum) , 'Antecessor')

Return
