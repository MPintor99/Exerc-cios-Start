#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE LEFT      1
#DEFINE CENTER    2
#DEFINE RIGHT     3
#DEFINE GERAL     1
#DEFINE NUMERO    2
#DEFINE MONETARIO 3

#DEFINE VERMELHO '#FF0000'
#DEFINE AZUL     '#0000FF'

/*/{Protheus.doc} User Function L12Ex02
    2 – Crie uma função que gerará uma planilha com todos os
    cadastros de produtos existentes no banco de dados,
    incluindo os excluídos.
    @type  Function
    @author Matheus Pintor
    @since 20/04/2023
    /*/
User Function L12Ex02()
    Local cAlias := Geracons()

    GeraPlan(cAlias)
Return


Static Function Geracons()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := 'SELECT B1_COD, B1_DESC, B1_TIPO, B1_UM, B1_PRV1, D_E_L_E_T_ AS DEL ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF


    TCQUERY cQuery ALIAS &(cAlias) NEW

    (cAlias)->(DbGoTop())

    if (cAlias)->(EOF())
       cAlias := '' 
    endif

    RestArea(aArea)
Return cAlias

Static Function GeraPlan(cAlias)
    Local oExcel  := FwMsExcelEx():New() //! Instanciando a classe para criação da Planilha
    Local cPath   := GetTempPath()
    Local cArq    := 'L12Ex02.xls'

    oExcel:AddWorkSheet('Produtos')

    oExcel:AddTable('Produtos', 'Dados dos Produtos')

    oExcel:AddColumn('Produtos', 'Dados dos Produtos', 'Codigo', LEFT, GERAL)
    oExcel:AddColumn('Produtos', 'Dados dos Produtos', 'Descricao', LEFT, GERAL)
    oExcel:AddColumn('Produtos', 'Dados dos Produtos', 'Tipo', CENTER, GERAL)
    oExcel:AddColumn('Produtos', 'Dados dos Produtos', 'UM', CENTER, GERAL)
    oExcel:AddColumn('Produtos', 'Dados dos Produtos', 'Preço Venda', RIGHT, MONETARIO)

    DbSelectArea(cAlias)

    While (cAlias)->(!EOF())

        If ((cAlias)->(B1_PRV1)) == 0
            cString := '0,00'
        Else
            cString := ((cAlias)->(B1_PRV1))
        Endif

        If ((cAlias)->(DEL)) == '*'
            oExcel:SetCelFrColor(VERMELHO)

            oExcel:AddRow('Produtos', 'Dados dos Produtos', {AllTrim((cAlias)->(B1_COD)), AllTrim((cAlias)->(B1_DESC)), AllTrim((cAlias)->(B1_TIPO)), AllTrim((cAlias)->(B1_UM)), cString}, {1, 2, 3, 4, 5})

        Else
            oExcel:SetCelFrColor(AZUL)

            oExcel:AddRow('Produtos', 'Dados dos Produtos', {AllTrim((cAlias)->(B1_COD)), AllTrim((cAlias)->(B1_DESC)), AllTrim((cAlias)->(B1_TIPO)), AllTrim((cAlias)->(B1_UM)), cString}, {1, 2, 3, 4, 5})
        Endif

        DbSkip()
    Enddo

    //? Alterando estilos do título da planilha
    oExcel:SetTitleFont('Times New Roman')
    oExcel:SetTitleSizeFont(14)
    oExcel:SetTitleBold(.T.)
    //   oExcel:SetTitleBgColor('#FFFFFF')
    //   oExcel:SetTitleFrColor('#000000')

    //? Alterando estilos do cabeçalho das colunas
    oExcel:SetHeaderFont('Times New Roman')
    oExcel:SetHeaderSizeFont(12)
    oExcel:SetHeaderBold(.T.)
    //   oExcel:SetBgColorHeader('#550099')
    //   oExcel:SetFrColorHeader('#FFFFFF')

    //? Ativando a classe
    oExcel:Activate()

    //? Gerando arquivo físico
    oExcel:GetXMLFile(cPath + cArq)

    //? Verifica se tem o Excel instalado no PC
    if ApOleClient('MsExcel')
        oExec := MsExcel():New()

        oExec:WorkBooks:Open(cPath + cArq)

        oExec:SetVisible(.T.)

        oExec:Destroy()
    else
        cMsg := 'Microsoft Excel não encontrado!' + CRLF

        cMsg += 'Arquivo salvo em: ' + cPath + cArq

        FwAlertError(cMsg, 'Atenção!')
    endif

    RestArea(cAlias)

    //? Desativando a classe
    oExcel:DeActivate()
Return
