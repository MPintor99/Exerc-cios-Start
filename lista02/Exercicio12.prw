// 12 - Elaborar um programa que exiba na tela
// automaticamente todos os m�ltiplos de 3
// existentes entre 1 e 100.

#INCLUDE 'TOTVS.CH'

User Function L2Ex12()
    Local nI      := 1
    Local cMostra := ''

    For nI := 1 to 100
        IF (nI % 3) == 0 // Se o resultado da divis�o do n�mero de 1 at� 100 por 3 for 0, ele � divisivel por 3
            cMostra := cMostra + cValToChar(nI) + CRLF
        ENDIF
    NEXT

    FwAlertSuccess('Os n�meros entre 1 e 100 divis�veis por 3 s�o: ' + cMostra, )
Return
