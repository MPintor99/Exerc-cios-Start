// • 7 - As maçãs custam R$ 1,30 cada se forem
// compradas menos de uma dúzia, e R$ 1,00 se forem
// compradas pelo menos 12. Escreva um programa
// que leia o número de maçãs compradas, calcule e
// escreva o custo total da compra.

#INCLUDE 'TOTVS.CH'

User Function Ex007()
    Local cMaca  := ''
    Local nPreco := 0

    cMaca := FwInputBox('Quantas maçãs você comprou?' , cMaca)

    If Val(cMaca) <12
        nPreco := Val(cMaca) * 1.30
    Else
        nPreco := Val(cMaca) * 1.00
    Endif

    FwAlertInfo('O custo total da compra foi: R$' + cValToChar(NoRound(nPreco,2)))
Return
