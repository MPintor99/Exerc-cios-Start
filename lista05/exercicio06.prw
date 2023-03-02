// 6 – Ler dois arrays, A e B de 10 elementos cada e
// calcular um array C onde seu primeiro elemento é o
// primeiro elemento de A, seu segundo elemento é o
// primeiro de B, seu terceiro elemento é o segundo
// de A, e assim sucessivamente. Note que o array C
// deverá ter 20 elementos. Exibir o conteúdo do
// array C.

User Function L05Ex06()
    Local aArrayA := {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
    Local aArrayB := {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}
    Local aArrayC := {}
    Local nCont   := 0
    Local cMostra := ''

    For nCont := 1 to 10
        AADD(aArrayC, aArrayA[nCont])
        AADD(aArrayC, aArrayB[nCont])
    Next

    For nCont := 1 to 20 
        If nCont < 20
            cMostra += cValToChar(aArrayC[nCont]) + ', '
        Else 
            cMostra += cValToChar(aArrayC[nCont]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conteúdo do Array')

Return
