// 1 � Ler dois n�meros positivos e apresentar a
// soma, diferen�a, produto e quociente entre eles.

#INCLUDE 'TOTVS.CH'

User Function L04Ex01()
    Local nNum1  := SPACE(9)
    Local nNum2  := SPACE(9)
    Local nOpcao := 0
    Local cTitle := 'C�lculos' // T�tulo
    Local cTexto := 'Calculando'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Vari�vel objeto que recebe os componentes da caixa de di�logo

    //Cria uma caixa de di�logo no padr�o Windows com o t�tulo da vari�vel cT�tulo que come�a no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficar� dentro da janela de di�logo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto       SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'N�mero 1'   SIZE 55, 07 OF oDlg PIXEL
    @ 030, 040  MSGET nNum1      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET ir� abrir uma �rea de input que salvar� a informa��o dentro de uma vari�vel.
    @ 050, 010  SAY 'N�mero 2'   SIZE 55, 07 OF oDlg PIXEL
    @ 050, 040  MSGET nNum2      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de di�logo oDlg centralizada     

    if nOpcao == 1
        Calculos(Val(nNum1), Val(nNum2))
    Else
        FwAlertError('CANCELADO PELO USU�RIO', 'CANCELADO')
    endif
Return


//Fun��o que chamar� os c�lculos e ir� trazer a mensagem com a resposta.
Static Function Calculos(nNum1, nNum2)
    Local aNums := {}

    AADD(aNums, nNum1 )
    AADD(aNums, nNum2 )

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
