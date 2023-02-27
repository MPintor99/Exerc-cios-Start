// 1 – Ler dois números positivos e apresentar a
// soma, diferença, produto e quociente entre eles.

#INCLUDE 'TOTVS.CH'

User Function L04Ex01()
    Local nNum1  := SPACE(9)
    Local nNum2  := SPACE(9)
    Local nOpcao := 0
    Local cTitle := 'Cálculos' // Título
    Local cTexto := 'Calculando'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Variável objeto que recebe os componentes da caixa de diálogo

    //Cria uma caixa de diálogo no padrão Windows com o título da variável cTítulo que começa no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficará dentro da janela de diálogo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto       SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'Número 1'   SIZE 55, 07 OF oDlg PIXEL
    @ 030, 040  MSGET nNum1      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET irá abrir uma área de input que salvará a informação dentro de uma variável.
    @ 050, 010  SAY 'Número 2'   SIZE 55, 07 OF oDlg PIXEL
    @ 050, 040  MSGET nNum2      SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de diálogo oDlg centralizada     

    if nOpcao == 1
        Calculos(Val(nNum1), Val(nNum2))
    Else
        FwAlertError('CANCELADO PELO USUÁRIO', 'CANCELADO')
    endif
Return


//Função que chamará os cálculos e irá trazer a mensagem com a resposta.
Static Function Calculos(nNum1, nNum2)
    Local aNums := {}

    AADD(aNums, nNum1 )
    AADD(aNums, nNum2 )

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
