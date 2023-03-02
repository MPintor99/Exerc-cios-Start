// 3 – Elaborar um programa que popule um array de
// 30 posições com valores de 1 até 30. No final,
// exibir o conteúdo do array.

#INCLUDE 'TOTVS.CH'

User Function L05Ex03()
    Local aArray    := {}
    Local cMostra   := ''
    Local nContador := 0

    For nContador := 1 to 30
        aAdd(aArray, Randomize(1, 30))
    Next

        For nContador := 1 to 30 
        If nContador < 30
            cMostra += cValToChar(aArray[nContador]) + ', '
        Else 
            cMostra += cValToChar(aArray[nContador]) + '.'
        Endif
    Next

    FwAlertSuccess(cMostra, 'Conteúdo do Array')
Return
