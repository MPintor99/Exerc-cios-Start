//� 4 - Escreva um algoritmo para ler o sal�rio mensal atual de um funcion�rio e o percentual de reajuste. Calcular e escrever o valor do novo
//sal�rio.

#INCLUDE 'TOTVS.CH'

User Function Ex004()
    Local cSalario  := ''
    Local cReajuste := ''
    Local nSalFinal := ''
    
    cSalario := FwInputBox('Digite aqui o sal�rio mensal atual do funcion�rio.', cSalario)

    cReajuste := FwInputBox('Digite aqui o percentual de reajuste do sal�rio.', cReajuste)

    nSalFinal := Val(cSalario) + (Val(cSalario)*(Val(cReajuste)/100))

    FwAlertSuccess('O novo sal�rio do funcion�rio �: ' + cValToChar(nSalFinal))

Return 
