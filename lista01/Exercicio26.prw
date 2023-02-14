// 26 - Faça um algoritmo que calcule e escreva a
// média aritmética dos números inteiros entre 15
// (inclusive) e 100 (inclusive).

#INCLUDE 'TOTVS.CH'

User Function Ex026()
	Local nSoma := 0
	Local nQuantidade := 0
    Local nI := 0

	For nI := 15 to 100
		nSoma += nI
		nQuantidade++
	Next

	nMedia := nSoma / nQuantidade

	FwAlertSuccess('A média aritmética dos números entre 15 e 100 é: ' + cValToChar(nMedia))
Return
