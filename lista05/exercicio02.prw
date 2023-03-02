// 2 – Ler 10 elementos de um array e apresentá-los
// na ordem inversa em que foram lidos e
// armazenados.

User Function L05Ex02()
    Local aArray    := {}
    Local nContador := 1
    Local cMostra   := ''

    For nContador := 1 to 10
        aAdd(aArray, FwInputBox('Insira aqui o ' + cValToChar(nContador) + 'º número'))
    Next

    For nContador := 10 to 1 step -1
        If nContador > 1
            cMostra += aArray[nContador] + ', '
        Else 
            cMostra += aArray[nContador] + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Ordem Inversa')
Return
