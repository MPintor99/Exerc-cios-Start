// � 25 - Escreva um algoritmo para ler 10 n�meros e ao
// final da leitura escrever a soma total dos 10
// n�meros lidos.

#INCLUDE 'TOTVS.CH'

User Function Ex025()
	Local nSoma  := 0
    Local cValor := ''
    Local nI     := 0

	For nI := 1 to 10
		cValor := Val(FwInputBox('Digite o valor '))
		nSoma += cValor
	Next

	FwAlertSuccess('A soma dos 10 valores digitados �: ' + AllTrim(Str(nSoma)))

Return
