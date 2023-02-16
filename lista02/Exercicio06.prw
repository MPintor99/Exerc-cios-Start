// 6 – Efetuar a leitura de quatro números inteiros e
// apresentar os números que são divisíveis por 2 e 3.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex06()
    Local aNums := {}
    Local nNum  := ''
    Local nI    := 1
    Local cNums := ''

    For nI := 1 to 4
        While !EHNUMINT(nNum)//Loop que irá obrigar o usuário a colocar um número inteiro.
            nNum := FWInputBox('Insira aqui o ' + cValToChar(nI) + 'º número inteiro.')
        Enddo

        //Aqui adicionamos os números inteiros ao array aNums
        AADD(aNums, Val(nNum))
        nNum  := ''
    Next

    //Nessa parte, percorremos o array aNums e copiamos o conteúdo de suas posições para cNums, transformando os mesmos em string e concatenando-os.
    For nI := 1 to 4
        If (aNums[nI] % 2 = 0) .and. (aNums[nI] % 3 = 0)
                cNums += cValToChar(aNums[nI]) + '/ '
        Endif
    Next

    FwAlertSuccess('Dos números digitados, os que são divisíveis por 2 e 3 são: ' + CRLF + cNums)
Return
