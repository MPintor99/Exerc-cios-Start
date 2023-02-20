// 18 – Desenvolva uma função que solicite o nome do
// usuário e mostre-o na vertical em escada.

#INCLUDE 'TOTVS.CH'

User Function L3Ex18()
    Local cNome   := ''
    Local cMostra := ''
    Local nI      := 0

    //Nome já é recebido em maiúsculo
    cNome := Upper(FwInputBox('Escreva aqui seu nome', cNome))

    //Aqui ele já concatena o nome dentro de cMostra já salvando 1 letra em cada linha
    For nI := 1 to Len(cNome)
        cMostra += SUBSTR(cNome, 1, nI) + CRLF
    Next

    FwAlertSucces('O Resultado ficou assim: ' + CRLF + CRLF + cMostra, cNome)
Return
