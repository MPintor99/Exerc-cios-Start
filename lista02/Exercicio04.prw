// 4 – Ler dois inteiros (A e B) e imprimir o resultado
// do quadrado da diferença do primeiro valor pelo
// segundo.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex04()
    Local nMostraDif  := 0
    Local nMostraQuad := 0
    Local aNums       := {0, 0}
    Local nNum        := 0
    Local lLoop       := .T.

//Aqui é onde o usuário insere os dados do primeiro número
    nNum := FwInputBox('Insira aqui o primeiro número inteiro')

//Loop onde ele checa se o número inserido é inteiro com a função EHNUMINT que aceita números negativos, positivos e 0
        While lLoop
            If !EHNUMINT(nNum)
                FwAlertError('Você não inseriu um número inteiro. Por favor, Preste atenção!')
                nNum := FwInputBox('Insira aqui o primeiro número inteiro')
            Else
                aNums[1] := Val(nNum)
                lLoop := .F.
            Endif
        Enddo

        lLoop := .T.//iLoop volta a ser .T. para que não seja necessário uma nova variável para o loop abaixo.

    nNum := FwInputBox('Insira aqui o segundo número inteiro')

        While lLoop
            If !EHNUMINT(nNum)
                FwAlertError('Você não inseriu um número inteiro. Por favor, Preste atenção!')
                nNum := FwInputBox('Insira aqui o segundo número inteiro')
            Else
                aNums[2] := Val(nNum)
                lLoop := .F.
            Endif
        Enddo

//Aqui são realizados os cálculos da diferença e do resultado da mesma ao quadrado.
        nMostraDif  := (aNums[1] - aNums[2])
        nMostraQuad := (nMostraDif)^2

//Impressão do resultado.
        FwAlertSuccess('A diferença de ' + cValToChar(aNums[1]) + ' por ' + cValtoChar(aNums[2]) + ' é: ' + cValTochar(nMostraDif) + CRLF +;
        'e o quadrado desta diferença é: ' + cValToChar(nMostraQuad))
Return

