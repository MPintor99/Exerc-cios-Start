// � 7 - As ma��s custam R$ 1,30 cada se forem
// compradas menos de uma d�zia, e R$ 1,00 se forem
// compradas pelo menos 12. Escreva um programa
// que leia o n�mero de ma��s compradas, calcule e
// escreva o custo total da compra.

#INCLUDE 'TOTVS.CH'

User Function Ex007()
    Local cMaca  := ''
    Local nPreco := 0

    cMaca := FwInputBox('Quantas ma��s voc� comprou?' , cMaca)

    If Val(cMaca) <12
        nPreco := Val(cMaca) * 1.30
    Else
        nPreco := Val(cMaca) * 1.00
    Endif

    FwAlertInfo('O custo total da compra foi: R$' + cValToChar(NoRound(nPreco,2)))
Return
