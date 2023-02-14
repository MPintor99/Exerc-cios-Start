// • 23 - Ler 10 valores e escrever quantos desses
// valores lidos são NEGATIVOS.

#INCLUDE 'TOTVS.CH'

User Function Ex023()
	Local cValor     := ''
	Local nNegativos := 0
    Local nI         := 0

	For nI := 1 to 10
		cValor := FwInputBox('Digite o valor ', cValor)

		If Val(cValor) < 0
			nNegativos++
		EndIf
	Next

	FwAlertSuccess('Foram digitados ' + cValToChar(nNegativos) + ' valores negativos.')
Return
