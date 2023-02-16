// 12 - Elaborar um programa que exiba na tela
// automaticamente todos os múltiplos de 3
// existentes entre 1 e 100.

#INCLUDE 'TOTVS.CH'

User Function L2Ex12()
    Local nI      := 1
    Local cMostra := ''

    For nI := 1 to 100
        IF (nI % 3) == 0 // Se o resultado da divisão do número de 1 até 100 por 3 for 0, ele é divisivel por 3
            cMostra := cMostra + cValToChar(nI) + CRLF
        ENDIF
    NEXT

    FwAlertSuccess('Os números entre 1 e 100 divisíveis por 3 são: ' + cMostra, )
Return
