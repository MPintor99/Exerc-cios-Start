#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE LEFT      1
#DEFINE CENTER    2
#DEFINE RIGHT     3
#DEFINE GERAL     1

/*/{Protheus.doc} User Function L12Ex01
    1 – Desenvolva uma rotina que, ao ser
    executada, gere uma planilha com todos os
    cadastros de fornecedores.
    @type  Function
    @author Matheus Pintor
    @since 20/04/2023
    /*/
User Function L12Ex01()
    Local cAlias := Geracons()

    GeraPlan(cAlias)
Return


Static Function Geracons()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := 'SELECT A2_COD, A2_NOME, A2_LOJA, A2_CGC, A2_END, A2_BAIRRO, A2_MUN, A2_EST ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
    cQuery += "WHERE D_E_L_E_T_ = ' ' " + CRLF

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
    Local cArq    := 'L12Ex01.xls'
    Local cString := ' '

    oExcel:AddWorkSheet('Fornecedores')

    oExcel:AddTable('Fornecedores', 'Dados dos Fornecedores')

    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Codigo', LEFT, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Nome', LEFT, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Loja', CENTER, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'CNPJ/CPF', LEFT, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Endereco', LEFT, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Bairro', LEFT, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'Cidade', LEFT, GERAL)
    oExcel:AddColumn('Fornecedores', 'Dados dos Fornecedores', 'UF', CENTER, GERAL)

    DbSelectArea(cAlias)

    While (cAlias)->(!EOF())

        If Empty((cAlias)->(A2_CGC))
            cString := 'Não Informado'

        Elseif Len(AllTrim((cAlias)->(A2_CGC))) == 11
            cString := Alltrim(Transform((cAlias)->(A2_CGC), "@R 999.999.999-99"))

        Elseif Len(AllTrim((cAlias)->(A2_CGC))) == 14
            cString := Alltrim(Transform((cAlias)->(A2_CGC), "@R 99.999.999/9999-99"))

        Endif

        //? Adicionando linhas com dados em cada coluna
        oExcel:AddRow('Fornecedores', 'Dados dos Fornecedores', {AllTrim((cAlias)->(A2_COD)), AllTrim((cAlias)->(A2_NOME)), AllTrim((cAlias)->(A2_LOJA)), cString, AllTrim((cAlias)->(A2_END)), AllTrim((cAlias)->(A2_BAIRRO)), AllTrim((cAlias)->(A2_MUN)), AllTrim((cAlias)->(A2_EST))})
    
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
