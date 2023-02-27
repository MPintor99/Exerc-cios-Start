// 2 � Desenvolva um programa que converta D�lar
// (US$) para Real (R$). O programa dever� solicitar
// ao usu�rio o valor do D�lar e a quantidade de
// d�lares que deseja converter. No final,
// apresentar o valor total convertido para reais.

#INCLUDE 'TOTVS.CH'

User Function L04Ex02()
    Local nCota  := SPACE(9)
    Local nQtd   := SPACE(9)
    Local nOpcao := 0
    Local cTitle := 'Convers�o' // T�tulo
    Local cTexto := 'Calculando'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Vari�vel objeto que recebe os componentes da caixa de di�logo


    //Cria uma caixa de di�logo no padr�o Windows com o t�tulo da vari�vel cT�tulo que come�a no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficar� dentro da janela de di�logo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto          SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'Cota��o USD'   SIZE 55, 07 OF oDlg PIXEL
    @ 030, 050  MSGET nCota         SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET ir� abrir uma �rea de input que salvar� a informa��o dentro de uma vari�vel.
    @ 050, 010  SAY 'Quantidade'    SIZE 55, 07 OF oDlg PIXEL
    @ 050, 050  MSGET nQtd          SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de di�logo oDlg centralizada     

    if nOpcao == 1
        Conversao(Val(nCota), Val(nQtd))
    Else
        FwAlertError('CANCELADO PELO USU�RIO', 'CANCELADO')
    endif
Return

Static Function Conversao(nCota, nQtd)
    Local nReais := 0

    nReais := nCota * nQtd

    MSGALERT('No dia de hoje: U$' + Alltrim(Str(nQtd,15 ,2)) + CRLF + 'Equivalem a: R$' + Alltrim(Str(nReais,15 ,2)), DtoC(Date()))
Return
