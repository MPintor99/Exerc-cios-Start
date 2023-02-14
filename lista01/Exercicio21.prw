// 21 - Ler um valor N e imprimir todos os valores
// inteiros entre 1 (inclusive) e N (inclusive).
// Considere que o N será sempre maior que ZERO.

User Function Ex021()
	Local nNum    := 1
	Local cN      := ''
    Local cMostra := ''

	cN := FwInputBox("Digite o valor de N: ", cN)
        cN := Val(cN)

	Do While nNum <= cN
        IF nNum < cN
            cMostra := cMostra + Alltrim(Str(nNum) + ',')
        ELSE
            cMostra := cMostra + Alltrim(Str(nNum) + '.')
        ENDIF
		nNum++
	EndDo
    FwAlertSuccess('Os números entre 1 e ' + cValToChar(cN) + 'são: ' + cMostra)
Return
