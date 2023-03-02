// 7 – Ler um array A de 15 elementos e a partir dele
// construir um array B de mesmo tamanho, sendo o
// inverso de A, ou seja, o primeiro elemento de B
// deverá receber o último de A o segundo de B
// deverá receber o penúltimo de A e assim por
// diante.

User Function L05Ex07()
    Local aArrayA := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}
    Local aArrayB := {}
    Local nCOnt   := 0
    Local cMostra := ''

    For nCont := 15 to 1 step -1
        AADD(aArrayB, aArrayA[nCont])
    Next

    For nCont := 1 to 15
        If nCont < 15
            cMostra += cValToChar(aArrayB[nCont]) + ', '
        Else 
            cMostra += cValToChar(aArrayB[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conteúdo do Array')
Return
