// 33 - Faça um algoritmo para ler 20 números e
// armazenar em um array aNumeros, verificar e
// escrever se existem números repetidos no array
// aNumeros e em que posições se encontram.

#INCLUDE 'TOTVS.CH'

User Function Ex033()
    Local nNumero := 0
    Local aArray  := {}
    Local aPosi   := {{},{},{},{},{}}
    Local nI      := 0
    Local nJ      := 0
    Local cMostra := ''


    For nI := 1 to 5
        nNumero := Val(FwInputBox('Digite aqui o ' + AllTrim(STR(nI)) + 'º número do array.'))
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
        FwAlertSuccess('O número na' + cValToChar(nI) + 'posição, se repeta nas posições: ' + cMostra)
    Next

return

