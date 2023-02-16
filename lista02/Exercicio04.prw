// 4 � Ler dois inteiros (A e B) e imprimir o resultado
// do quadrado da diferen�a do primeiro valor pelo
// segundo.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex04()
    Local nMostraDif  := 0
    Local nMostraQuad := 0
    Local aNums       := {0, 0}
    Local nNum        := 0
    Local lLoop       := .T.

//Aqui � onde o usu�rio insere os dados do primeiro n�mero
    nNum := FwInputBox('Insira aqui o primeiro n�mero inteiro')

//Loop onde ele checa se o n�mero inserido � inteiro com a fun��o EHNUMINT que aceita n�meros negativos, positivos e 0
        While lLoop
            If !EHNUMINT(nNum)
                FwAlertError('Voc� n�o inseriu um n�mero inteiro. Por favor, Preste aten��o!')
                nNum := FwInputBox('Insira aqui o primeiro n�mero inteiro')
            Else
                aNums[1] := Val(nNum)
                lLoop := .F.
            Endif
        Enddo

        lLoop := .T.//iLoop volta a ser .T. para que n�o seja necess�rio uma nova vari�vel para o loop abaixo.

    nNum := FwInputBox('Insira aqui o segundo n�mero inteiro')

        While lLoop
            If !EHNUMINT(nNum)
                FwAlertError('Voc� n�o inseriu um n�mero inteiro. Por favor, Preste aten��o!')
                nNum := FwInputBox('Insira aqui o segundo n�mero inteiro')
            Else
                aNums[2] := Val(nNum)
                lLoop := .F.
            Endif
        Enddo

//Aqui s�o realizados os c�lculos da diferen�a e do resultado da mesma ao quadrado.
        nMostraDif  := (aNums[1] - aNums[2])
        nMostraQuad := (nMostraDif)^2

//Impress�o do resultado.
        FwAlertSuccess('A diferen�a de ' + cValToChar(aNums[1]) + ' por ' + cValtoChar(aNums[2]) + ' �: ' + cValTochar(nMostraDif) + CRLF +;
        'e o quadrado desta diferen�a �: ' + cValToChar(nMostraQuad))
Return

