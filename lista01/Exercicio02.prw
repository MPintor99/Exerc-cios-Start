//• 2 - Escreva um algoritmo para ler as dimensões de um retângulo (base e altura), calcular e escrever a área desse retângulo.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function Ex002()

    local cBase     := ''
    local cAltura   := ''
    local nArea     := 0

    cBase := FwInputBox('Digite o tamanho da base do retângulo em centímetros', cBase)

    While !EHNUMERO(cBase)// Validação de entrada que determina se é um número, seja ele positivo ou negativo.
        FwAlertError('Você não colocou um número' , 'Error')
        cBase := FwInputBox('Digite o tamanho da base do retângulo em centímetros', cBase)
    End

    cAltura := FwInputBox('Digite o tamanho da altura do retângulo em centímetros', cAltura)

    While !EHNUMERO(cAltura)// Validação de entrada que determina se é um número, seja ele positivo ou negativo.
        FwAlertError('Você não colocou um número' , 'Error')
        cAltura := FwInputBox('Digite o tamanho da altura do retângulo em centímetros', cAltura)
    End

    nArea := (Val(cBase) * Val(cAltura))

    FwAlertSuccess('A área do retângulo é: ' + cValToChar(nArea) + 'cm²' , 'Área retângulo')

Return
