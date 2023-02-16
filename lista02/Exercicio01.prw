// 1 � Ler dois n�meros positivos e apresentar a
// soma, diferen�a, produto e quociente entre eles.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex01()
    Local aNums := {0, 0}
    Local nNum  := ''
    Local lLoop := .T.

//Aqui o usu�rio digita o primeiro n�mero
    nNum := FwInputBox('Insira aqui o primeiro n�mero positivo')

//Loop onde ele ir� utilizar a fun��o EHNUMERO para verificar se o que foi digitado realmente � um n�mero,
//aceitando n�meros negativos e n�meros decimais. Caso n�o atenda estes requisitos ou o n�mero seja negativo
//um alerta de erro ir� aparecer e a fun��o pedir� o n�mero novamente.
    While lLoop
        If !EHNUMERO(nNum) .and. Val(nNum) < 0 
            FwAlertError('Voc� n�o inseriu um n�mero positivo, por favor. Preste aten��o!')
            nNum := FwInputBox('Insira aqui o primeiro n�mero positivo')
        Else //Caso o n�mero seja positivo, ele ir� adicion�-lo na primeira posi��o do Array aNums.
            aNums[1] := Val(nNum)
            lLoop := .F.
        Endif
    Enddo

    lLoop := .T.

    nNum := FwInputBox('Insira aqui o segundo n�mero positivo')

    While lLoop
        If !EHNUMERO(nNum) .and. Val(nNum) < 0 
            FwAlertError('Voc� n�o inseriu um n�mero positivo, por favor. Preste aten��o!')
            nNum := FwInputBox('Insira aqui o segundo n�mero positivo')
        Else
            aNums[2] := Val(nNum)
            lLoop := .F.
        Endif
    Enddo

//Essa parte ser� o 'print' final, onde optei por chamar as fun��es diretamente nele, ao inv�s de uma vari�vel.
    FwAlertSuccess(cValToChar(aNums[1]) + ' + ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Soma(aNums)) + CRLF +;
    cValToChar(aNums[1]) + ' - ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Diferenca(aNums)) + CRLF +;
    cValToChar(aNums[1]) + ' * ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Produto(aNums)) + CRLF +;
    cValToChar(aNums[1]) + ' / ' + cValToChar(aNums[2]) + ' = ' + cValToChar(Quociente(aNums)), 'C�lculos')

    
Return

//Fun��o que ir� realizar a soma dos n�meros da vari�vel
Static Function Soma(aNums)
    Local nSoma := 0

    nSoma := aNums[1] + aNums[2]

Return nSoma

//Fun��o que ir� realizar a subtra��o dos n�meros da vari�vel
Static Function Diferenca(aNums)
    Local nDif := 0

    nDif := aNums[1] - aNums[2]

Return nDif

//Fun��o que ir� realizar a multiplica��o dos n�meros da vari�vel
Static Function Produto(aNums)
    nProduto := 0

    nProduto := (aNums[1] * aNums[2])

Return nProduto

//Fun��o que ir� realizar a divis�o dos n�meros da vari�vel
Static Function Quociente(aNums)
    nQuociente := 0

    nQuociente := (aNums[1] / aNums[2])

Return nQuociente
