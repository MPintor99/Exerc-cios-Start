//� 10 - Ler 3 valores (considere que n�o ser�o informados valores iguais) e escrev�-los em ordem crescente.

#INCLUDE 'TOTVS.CH'

User Function Ex010()
    Local cVal    := ''
    Local aVal    := {}
    Local nI      := 0
    Local cResult := ''

    For nI := 1 To 3
        cVal := FwInputBox('Coloque aqui', cVal)
        //aVal[nI] := cVal
        aADD(aVal,Val(cVal))
    Next

    ASORT(aVal)

    For nI := 1 to len(aVal)
        if nI < len(aVal)
            cResult += alltrim(str(aVal[nI])) + ', '
        elseif nI = 3
            cResult += alltrim(str(aVal[nI])) + '.'
        endif    
    Next nI

    FwAlertInfo('Os n�meros em ordem crescente s�o: ' + cResult)

Return
