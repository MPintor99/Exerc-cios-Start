// 13 - Elaborar um programa que exiba na tela
// automaticamente todos os múltiplos de um
// determinado número informado pelo usuário,
// existentes entre 1 e um limite, que também deverá
// ser informado pelo usuário. Faça com apenas uma
// estrutura de repetição (For / While), antes de
// desenvolver, analise qual será a melhor opção.

#INCLUDE 'TOTVS.CH'

User Function L2Ex13()
    Local nI      := 1
    Local nNum    := 0
    Local nLim    := 0
    Local cMostra := ''

    nNum := Val(FwInputBox('Digite aqui o número que você deseja saber os múltiplas.'))

    nLim := Val(FwInputBox('Digite aqui o limite máximo de números a serem analisados.'))

    FOR nI := 1 to nLim //Aqui comeca o laco que o exercicio pede
        IF (nI % nNum) == 0
            cMostra := cMostra + cValToChar(nI) + CRLF
        ENDIF
    Next 

    FwAlertSuccess('Os números entre 1 e 100 divisíveis por 3 são: ' + cMostra, )

Return

