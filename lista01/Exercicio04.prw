//• 4 - Escreva um algoritmo para ler o salário mensal atual de um funcionário e o percentual de reajuste. Calcular e escrever o valor do novo
//salário.

#INCLUDE 'TOTVS.CH'

User Function Ex004()
    Local cSalario  := ''
    Local cReajuste := ''
    Local nSalFinal := ''
    
    cSalario := FwInputBox('Digite aqui o salário mensal atual do funcionário.', cSalario)

    cReajuste := FwInputBox('Digite aqui o percentual de reajuste do salário.', cReajuste)

    nSalFinal := Val(cSalario) + (Val(cSalario)*(Val(cReajuste)/100))

    FwAlertSuccess('O novo salário do funcionário é: ' + cValToChar(nSalFinal))

Return 
