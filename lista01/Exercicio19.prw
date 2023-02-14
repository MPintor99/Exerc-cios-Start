// 19 - Escreva um algoritmo para imprimir os números
// de 1 (inclusive) a 10 (inclusive) em ordem
// decrescente.

#INCLUDE 'TOTVS.CH'

User Function Ex019()
	Local nNum := 10

	Do While nNum >= 1
		FwAlertInfo(cValToChar(nNum))
		nNum--
	EndDo

    FwAlertSuccess('Contagem finalizada!')
    
Return
