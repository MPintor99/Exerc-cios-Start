// 2 – Desenvolva um programa que converta Dólar
// (US$) para Real (R$). O programa deverá solicitar
// ao usuário o valor do Dólar e a quantidade de
// dólares que deseja converter. No final,
// apresentar o valor total convertido para reais.

#INCLUDE 'TOTVS.CH'

User Function L04Ex02()
    Local nCota  := SPACE(9)
    Local nQtd   := SPACE(9)
    Local nOpcao := 0
    Local cTitle := 'Conversão' // Título
    Local cTexto := 'Calculando'
    Local nJanLarg := 250
    Local nJanAltu := 200
    Private oDlg   := NIL // Variável objeto que recebe os componentes da caixa de diálogo


    //Cria uma caixa de diálogo no padrão Windows com o título da variável cTítulo que começa no canto (FROM) que define a alta e a largura 
    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO nJanAltu, nJanLarg PIXEL

    //Item que ficará dentro da janela de diálogo ('OF' define o componente pai)
    @ 014, 010  SAY cTexto          SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010  SAY 'Cotação USD'   SIZE 55, 07 OF oDlg PIXEL
    @ 030, 050  MSGET nCota         SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'//MSGET irá abrir uma área de input que salvará a informação dentro de uma variável.
    @ 050, 010  SAY 'Quantidade'    SIZE 55, 07 OF oDlg PIXEL
    @ 050, 050  MSGET nQtd          SIZE 55, 11 OF oDlg PIXEL PICTURE '@9'

    DEFINE SBUTTON FROM 080, 040 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
    DEFINE SBUTTON FROM 080, 070 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg


    ACTIVATE MSDIALOG oDlg CENTERED // Ativa a caixa de diálogo oDlg centralizada     

    if nOpcao == 1
        Conversao(Val(nCota), Val(nQtd))
    Else
        FwAlertError('CANCELADO PELO USUÁRIO', 'CANCELADO')
    endif
Return

Static Function Conversao(nCota, nQtd)
    Local nReais := 0

    nReais := nCota * nQtd

    MSGALERT('No dia de hoje: U$' + Alltrim(Str(nQtd,15 ,2)) + CRLF + 'Equivalem a: R$' + Alltrim(Str(nReais,15 ,2)), DtoC(Date()))
Return
