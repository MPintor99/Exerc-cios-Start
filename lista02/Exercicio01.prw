// 1 – Ler dois números positivos e apresentar a
// soma, diferença, produto e quociente entre eles.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex01()
    Local aNums := {0, 0}
    Local nNum  := ''
    Local lLoop := .T.

//Aqui o usuário digita o primeiro número
    nNum := FwInputBox('Insira aqui o primeiro número positivo')

//Loop onde ele irá utilizar a função EHNUMERO para verificar se o que foi digitado realmente é um número,
//aceitando números negativos e números decimais. Caso não atenda estes requisitos ou o número seja negativo
//um alerta de erro irá aparecer e a função pedirá o número novamente.
    While lLoop
        If !EHNUMERO(nNum) .and. Val(nNum) < 0 
            FwAlertError('Você não inseriu um número positivo, por favor. Preste atenção!')
            nNum := FwInputBox('Insira aqui o primeiro número positivo')
        Else //Caso o número seja positivo, ele irá adicioná-lo na primeira posição do Array aNums.
            aNums[1] := Val(nNum)
            lLoop := .F.
        Endif
    Enddo

    lLoop := .T.

    nNum := FwInputBox('Insira aqui o segundo número positivo')

    While lLoop
        If !EHNUMERO(nNum) .and. Val(nNum) < 0 
            FwAlertError('Você não inseriu um número positivo, por favor. Preste atenção!')
            nNum := FwInputBox('Insira aqui o segundo número positivo')
        Else
            aNums[2] := Val(nNum)
            lLoop := .F.
        Endif
    Enddo

//Essa parte será o 'print' final, onde optei por chamar as funções diretamente nele, ao invés de uma variável.
    FwAlertSuccess(cValToChar(aNums[1]) + ' + ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Soma(aNums)) + CRLF +;
    cValToChar(aNums[1]) + ' - ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Diferenca(aNums)) + CRLF +;
    cValToChar(aNums[1]) + ' * ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Produto(aNums)) + CRLF +;
    cValToChar(aNums[1]) + ' / ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Quociente(aNums)), 'Cálculos')

    
Return

//Função que irá realizar a soma dos números da variável
Static Function Soma(aNums)
    Local nSoma := 0

    nSoma := aNums[1] + aNums[2]

Return nSoma

//Função que irá realizar a subtração dos números da variável
Static Function Diferenca(aNums)
    Local nDif := 0

    nDif := aNums[1] - aNums[2]

Return nDif

//Função que irá realizar a multiplicação dos números da variável
Static Function Produto(aNums)
    nProduto := 0

    nProduto := (aNums[1] * aNums[2])

Return nProduto

//Função que irá realizar a divisão dos números da variável
Static Function Quociente(aNums)
    nQuociente := 0

    nQuociente := (aNums[1] / aNums[2])

Return nQuociente
