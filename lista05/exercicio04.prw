// 4 � Elaborar um programa que popule um array de
// 10 posi��es com valores pares a partir de 2 at� o
// 20. No final, exibir o conte�do do array.

#INCLUDE 'TOTVS.CH'

User Function L05Ex04()
    Local aArray    := {}
    Local nContador := 0
    Local cMostra   := ''

    For nContador := 2 to 20 step 2
        aAdd(aArray, nContador)
    Next

    For nContador := 1 to 10 
        If nContador < 10
            cMostra += cValToChar(aArray[nContador]) + ', '
        Else 
            cMostra += cValToChar(aArray[nContador]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conte�do do Array')
Return
