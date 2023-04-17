#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'RPTDEF.CH'
#INCLUDE 'FWPRINTSETUP.CH'

//? Cores
#DEFINE PRETO    RGB(000, 000, 000)
#DEFINE VERMELHO RGB(255, 000, 000)

#DEFINE MAX_LINE  770

/*/{Protheus.doc} User Function L11Ex01
    Relat�rio L11Ex01
    @type  Function
    @author Matheus Pintor
    @since 13/04/2023
    /*/
User Function L11Ex01()
    Local cAlias := GeraCons()

    if !Empty(cAlias)
        //? R�gua de processamento
	    Processa({|| MontaRel(cAlias)}, 'Aguarde...', 'Imprimindo relat�rio...', .F.)
    else    
        FwAlertError('Nenhum Registro encontrado!', 'Aten��o')
    endif
Return 

Static Function GeraCons()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''

    cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD, B1_MSBLQL' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
    cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF

    TCQUERY cQuery ALIAS (cAlias) NEW
    
    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
       cAlias := '' 
    endif
    
    RestArea(aArea)
Return cAlias

//? Fun��o principal (Cria��o do Relat�rio)
Static Function MontaRel(cAlias)
    Local cPath := GetTempPath()
    Local cArquivo := 'CadProd.pdf'

    //!Come�o das vari�veis privadas
    Private nLinha  := 105
    Private nColIni := 20
    Private nColFim := 820
    Private oPrint

    //! TFont():New(cNomeFont,/Compat./, nFontSize, /Compat./, lBold,/Compat./,/Compat./,/Compat./,/Compat./, lUnderline, lItalic)
    Private oFont10 := TFont():New('Times New Roman', /*Compat*/, 10, /*Compat*/, .F. /*Negrito*/, /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F./*Sublinhado*/, .F./*Italico*/)
    Private oFont12 := TFont():New('Times New Roman', /*Compat*/, 12, /*Compat*/, .F., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont14 := TFont():New('Times New Roman', /*Compat*/, 14, /*Compat*/, .F., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont16 := TFont():New('Times New Roman', /*Compat*/, 16, /*Compat*/, .T., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .T., .F.)

    //!FWMsPrinter():New(<cFilePrintert>, [nDevice], [lAdjustToLegacy], [cPathInServer], [lDisabeSetup], [lTReport], [@oPrintSetup], [cPrinter], [lServer], [lPDFAsPNG], [lRaw], [lViewPDF], [nQtdCopy])
    oPrint := FwMSPrinter():New(cArquivo, IMP_PDF, .F., ' ', .T., /*TR*/, @oPrint, ' ', /*LServer*/, /*Compat*/, /*RAW*/, .T., /*QtdC�pias*/)
    oPrint:cPathPDF := cPath

    oPrint:SetPortrait() //!Deixa a orienta��o como retrato.
    oPrint:SetPaperSize(9) //!Seleciona o tamanho da folha de papel.

    oPrint:StartPage() //!Come�a a p�gina para impress�o.

    Cabecalho()
    ImpDados(cAlias)



    oPrint:EndPage() //!Finaliza a p�gina para impress�o.

    oPrint:Preview() //!Mostra o relat�rio

Return

Static Function Cabecalho()
    //! Criando caixa para colocar texto
    oPrint:Box(015, 015, 085, 580, '-8')

    //!Criando uma linha
    oPrint:Line(50, 15, 50, 580, PRETO, '-6')

    oPrint:Say(35, 20, 'Empresa / Filial : ' + Alltrim(SM0->M0_NOME) + ' / ' + Alltrim(SMO->MO_FILIAL), oFont14, /*LargText*/, PRETO)
    oPrint:Say(70, 220, 'Cadastros de Produtos ', oFont16, /*LargText*/, PRETO)

    oPrint:Say(nLinha, 20, 'C�DIGO'    , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 100, 'DESCRI��O'      , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 250, 'UM' , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 320, 'PRE�O'   , oFont12, /*LargText*/, PRETO)
    oPrint:Say(nLinha, 400, 'ARMAZ�M'   , oFont12, /*LargText*/, PRETO)

    nLinha += 5

    oPrint:Line(nLinha, 15, nLinha, 580, PRETO, '-6')

    nLinha += 20
Return

Static Function ImpDados(cAlias)
    Local cString := ''
    Private nCor  := 0

    DbSelectArea(cAlias)

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())

        //? Verificando se atingiu o n�mero m�ximo de linhas para uma p�gina (770)
        VeriQuebPg()

        If Alltrim((cAlias)->(B1_MSBLQL)) == '1'
            nCor := VERMELHO
        Else
            nCor := PRETO
        Endif

        oPrint:Say(nLinha, 020, AllTrim((cAlias)->(B1_COD)), oFont10,, nCor)

        //? Copiando o Descri��o do produto para a vari�vel cString
        cString  := AllTrim((cAlias)->(B1_DESC))
        //? Chamando fun��o que verifica se h� a necessidade de quebrar a linha
        VeriQuebLn(cString, 20, 100)

        oPrint:Say(nLinha, 250, AllTrim((cAlias)->(B1_UM)), oFont10,, nCor) //!unidade de medida

        If (cAlias)->(B1_PRV1) == 0
            cString := '0,00'
        Else
            cString := cValToChar((cAlias)->(B1_PRV1))
        Endif

        oPrint:Say(nLinha, 320, 'R$ ' + cString, oFont10,, nCor)

        oPrint:Say(nLinha, 420, AllTrim((cAlias)->(B1_LOCPAD)), oFont10,, nCor)

        nLinha += 30

        IncProc()

        (cAlias)->(DbSkip())
    Enddo

Return

Static Function VeriQuebLn(cString, nQtdCar, nCol)
    Local cTxtLinha  := ''
    Local lTemQuebra := .F.
    Local nQtdLinhas := MLCount(cString, nQtdCar, /*Tabula��o*/, .F.)
    Local nI         := 0

    If nQtdLinhas > 1
        lTemQuebra := .T.

            For nI := 1 to nQtdLinhas
                cTxtLinha := MemoLine(cString, nQtdCar, nI)

                oPrint:Say(nLinha, nCol, cTxtLinha, oFont10,, nCor)
                nLinha += 10
            Next
    Else
        oPrint:Say(nLinha, nCol, cString, oFont10,, nCor)
    Endif

    If lTemQuebra
        nLinha -= nQtdLinhas * 10
    Endif
Return

Static Function VeriQuebPg()
    if nLinha > MAX_LINE
        //? Encerrando a p�gina atual
        oPrint:EndPage()
        //? Iniciando uma nova p�gina
        oPrint:StartPage()
        nLinha := 105
        
        //? Imprimindo o cabe�alho
        Cabecalho()
    endif
Return
