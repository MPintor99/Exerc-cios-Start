// 33 - Fa�a um algoritmo para ler 20 n�meros e
// armazenar em um array aNumeros, verificar e
// escrever se existem n�meros repetidos no array
// aNumeros e em que posi��es se encontram.

#INCLUDE 'TOTVS.CH'

User Function Ex033()
    Local nNumero := 0
    Local aArray  := {}
    Local aPosi   := {{},{},{},{},{}}
    Local nI      := 0
    Local nJ      := 0
    Local cMostra := ''


    For nI := 1 to 5
        nNumero := Val(FwInputBox('Digite aqui o ' + AllTrim(STR(nI)) + '� n�mero do array.'))
        AADD(aArray, nNumero)
    Next

    For nI := 1 to 5
        For nJ := 1 to 5
            If aArray[nI] == aArray[nJ]
                AADD(aPosi, aArray[nI][nJ])
            Endif
        Next
    Next

    For nI := 1 to 5
        For nJ := 1 to 5
            cMostra := ''
            cMostra += (Alltrim(STR(aArray[nI])) + ',')
        Next
        FwAlertSuccess('O n�mero na' + cValToChar(nI) + 'posi��o, se repeta nas posi��es: ' + cMostra)
    Next

return

