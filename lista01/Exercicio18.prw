// 18 - Escreva um algoritmo para imprimir os números
// de 1 (inclusive) a 10 (inclusive) em ordem
// crescente.

#INCLUDE 'PROTHEUS.CH'

User Function Ex018()
	Local nNum := 1

	Do While nNum <= 10
		FwAlertInfo(cValToChar(nNum))
		nNum++
	EndDo

    FwAlertSuccess('Contagem finalizada!')
    
Return
