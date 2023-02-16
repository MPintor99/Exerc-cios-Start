// 13 - Elaborar um programa que exiba na tela
// automaticamente todos os m�ltiplos de um
// determinado n�mero informado pelo usu�rio,
// existentes entre 1 e um limite, que tamb�m dever�
// ser informado pelo usu�rio. Fa�a com apenas uma
// estrutura de repeti��o (For / While), antes de
// desenvolver, analise qual ser� a melhor op��o.

#INCLUDE 'TOTVS.CH'

User Function L2Ex13()
    Local nI      := 1
    Local nNum    := 0
    Local nLim    := 0
    Local cMostra := ''

    nNum := Val(FwInputBox('Digite aqui o n�mero que voc� deseja saber os m�ltiplas.'))

    nLim := Val(FwInputBox('Digite aqui o limite m�ximo de n�meros a serem analisados.'))

    FOR nI := 1 to nLim //Aqui comeca o laco que o exercicio pede
        IF (nI % nNum) == 0
            cMostra := cMostra + cValToChar(nI) + CRLF
        ENDIF
    Next 

    FwAlertSuccess('Os n�meros entre 1 e 100 divis�veis por 3 s�o: ' + cMostra, )

Return

