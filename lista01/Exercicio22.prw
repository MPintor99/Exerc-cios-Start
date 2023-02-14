// • 22 - Ler um valor inteiro (aceitar somente valores
// entre 1 e 10) e escrever a tabuada de 1 a 10 do
// valor lido.

#INCLUDE 'TOTVS.CH'

User Function Ex022()
	Local cValor  := ''
    Local nI      := 0
    Local cResult := ''

	cValor := FwInputBox('Digite um valor inteiro entre 1 e 10:')
        cValor := Val(cValor)

	Do While cValor < 1 .OR. cValor > 10
		cValor := FwInputBox('Valor inválido. Digite um valor inteiro entre 1 e 10:')
            cValor := Val(cValor)
	EndDo

	For nI := 1 to 10
		cResult += Alltrim(STR(cValor)) + ' x ' + Alltrim(STR(nI)) + ' = ' + Alltrim(STR(cValor * nI)) + CRLF//Usei Chr porquê CLRF não estava funcionando por algum motivo.
	Next

	FwAlertSuccess(cResult)
Return
