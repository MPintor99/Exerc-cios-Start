// 6 � Efetuar a leitura de quatro n�meros inteiros e
// apresentar os n�meros que s�o divis�veis por 2 e 3.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex06()
    Local aNums := {}
    Local nNum  := ''
    Local nI    := 1
    Local cNums := ''

    For nI := 1 to 4
        While !EHNUMINT(nNum)//Loop que ir� obrigar o usu�rio a colocar um n�mero inteiro.
            nNum := FWInputBox('Insira aqui o ' + cValToChar(nI) + '� n�mero inteiro.')
        Enddo

        //Aqui adicionamos os n�meros inteiros ao array aNums
        AADD(aNums, Val(nNum))
        nNum  := ''
    Next

    //Nessa parte, percorremos o array aNums e copiamos o conte�do de suas posi��es para cNums, transformando os mesmos em string e concatenando-os.
    For nI := 1 to 4
        If (aNums[nI] % 2 = 0) .and. (aNums[nI] % 3 = 0)
                cNums += cValToChar(aNums[nI]) + '/ '
        Endif
    Next

    FwAlertSuccess('Dos n�meros digitados, os que s�o divis�veis por 2 e 3 s�o: ' + CRLF + cNums)
Return
