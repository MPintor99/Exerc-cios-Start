// 17 � Desenvolva uma fun��o que solicite o nome do
// usu�rio e mostre-o na vertical.

#INCLUDE 'TOTVS.CH'

User Function L3Ex17()
    Local cNome   := ''
    Local cMostra := ''
    Local nI      := 0

    //Nome j� � recebido em mai�sculo
    cNome := Upper(FwInputBox('Escreva aqui seu nome', cNome))

    //Aqui ele j� concatena o nome dentro de cMostra j� salvando 1 letra em cada linha
    For nI := 1 to Len(cNome)
        cMostra += SUBSTR(cNome, nI, 1) + CRLF
    Next

    FwAlertSucces('O Resultado ficou assim: ' + CRLF + CRLF + cMostra, cNome)
Return
