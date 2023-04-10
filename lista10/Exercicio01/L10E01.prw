#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'

/*/{Protheus.doc} User Function L10E01
    Lista 10 exercício 01
    @type  Function
    @author Matheus Pintor
    @since 05/04/2023
    /*/
User Function L10E01()
    Local oReport := CriaReport()

    oReport:PrintDialog()
Return 

Static Function CriaReport()
    Local cAlias := GetNextAlias()
    Local oRel := TReport():New('TREPORT', 'Relatório de Produtos', /**/, {|oRel| Imprime(oRel, cAlias)}, 'Esse relatório imprimirá todos os cadastros de produtos.', .F.)
    Local oSection := TRSection():New(oRel, 'Cadastros de Produto')

    //? Coluna Código
    TRCell():New(oSection, 'B1_COD', 'SB1', 'Código', /*Picture*/, 8, /*Pixel*/, /*CodBloc*/, 'CENTER', .T., 'CENTER', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 

    //? Coluna Descrição
    TRCell():New(oSection, 'B1_DESC', 'SB1', 'Descrição', /*Picture*/, 30, /*Pixel*/, /*CodBloc*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)

    //? Coluna Unidade de Medida
    TRCell():New(oSection, 'B1_UM', 'SB1', 'UM', /*Picture*/, 4, /*Pixel*/, /*CodBloc*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)  

    //? Coluna Preço de venda
    TRCell():New(oSection, 'B1_PRV1', 'SB1', 'Preço R$', /*picture*/, 9, /*Pixel*/, /*CodBloc*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 

    //? Coluna Armazém
    TRCell():New(oSection, 'B1_LOCPAD', 'SB1', 'Armazém', /*Picture*/, 4, /*Pixel*/, /*CodBloc*/, 'CENTER', .F., 'CENTER', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 
Return oRel

Static Function Imprime(oRel, cAlias)
    Local oSection := oRel:Section(1)
    Local nTotReg  := 0
    Local cQuery   := CriaQuery()

    DBUseArea(.T., 'TOPCONN', TcGenQry(, , cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oRel:SetMeter(nTotReg)

    oRel:SetTitle('Relatório de Clientes')

    oRel:StartPage()

    oSection:Init()

    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())
        If oRel:Cancel()
            Exit
        Endif

        oSection:Cell('B1_COD'):SetValue((cAlias)->B1_COD)

		oSection:Cell('B1_DESC'):SetValue((cAlias)->B1_DESC)
		
		oSection:Cell('B1_UM'):SetValue((cAlias)->B1_UM)
		
		oSection:Cell('B1_PRV1'):SetValue((cAlias)->B1_PRV1)
		
        If !Empty(SB1->B1_PRV1) //Verifica se o arquivo está vazio
            oSection:Cell('B1_PRV1'):SetValue('R$' + (cAlias)->B1_PRV1)
        Endif

		oSection:Cell('B1_LOCPAD'):SetValue((cAlias)->B1_LOCPAD)
		
        oSection:PrintLine()

		oRel:ThinLine()

		oRel:IncMeter()

		(cAlias)->(DBSkip())
    Enddo

    (cAlias)->(DBCloseArea())
	
	oSection:Finish()			
	
	oRel:EndPage()
Return

Static Function CriaQuery()
    Local cQuery := ''

    cQuery += 'SELECT B1_COD, B1_DESC, B1_UM, B1_PRV1, B1_LOCPAD' + CRLF
	cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '" + CRLF
Return cQuery
