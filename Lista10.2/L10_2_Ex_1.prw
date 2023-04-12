#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'
#INCLUDE 'TOPCONN.CH'

/*/{Protheus.doc} User Function L10_2_Ex1
    Exercício 1 da lista 10.2
    @type  Function
    @author Matheus Pintor
    @since 12/04/2023
    /*/
User Function L102E1()
    Local oReport := Gerareport()

    oReport:PrintDialog()
Return

Static Function GeraReport()
    Local cAlias := GetNextAlias()
    Local oBreak 

    //! Instanciando a classe de impresão
    Local oReport	:= TReport():New('TReport', 'Relatório de Pedidos de Venda',,{|oReport| Imprime(oReport, cAlias)}, 'Infomações de Pedidos de Compra',.F.,,,, .T., .T.)	
    
    //!Instanciando a classe de Seção.
    Local oSection1 := TRSection():New(oReport, 'Pedidos de Venda Cadastrados',,, .F., .T.)
    Local oSection2 := TRSection():New(oSection1, 'Itens do Pedido',,,.F.,.T.)

    //! Seção 1
    //? Pedido de Venda
    TRCell():New(oSection1, 'C5_NUM', 'SC5', 'Nº Pedido', /*Picture*/, 8, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection1, 'A1_NOME', 'SA1', 'Nome Cliente', /*Picture*/, 30, /*Pixel*/,  /*Code-Bloc*/, 'LEFT', .T., 'LEFT', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection1, 'C5_EMISSAO', 'SC5', 'Data Emissão', /*Picture*/, 14, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection1, 'E4_DESCRI', 'SE4', 'Cond. Pagamento', /*Picture*/, 15, /*Pixel*/,  /*Code-Bloc*/, 'LEFT', .T., 'LEFT', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)

    //! Seção 2
    //? Itens do Pedido
    TRCell():New(oSection2, 'C6_ITEM', 'SC6', 'Nº Item', /*Picture*/, 8, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_PRODUTO', 'SC6', 'Código do Produto', /*Picture*/, 8, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_DESCRI', 'SC6', 'Descrição do Produto', /*Picture*/, 30, /*Pixel*/,  /*Code-Bloc*/, 'LEFT', .T., 'LEFT', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_QTDVEN', 'SC6', 'Quantidade Vendida', /*Picture*/, 4, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_PRCVEN', 'SC6', 'Valor Unitário', /*Picture*/, 10, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_VALOR', 'SC6', 'Valor Total', /*Picture*/, 10, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)

    oBreak := TRBreak():New(oSection1, oSection1:Cell('C5_NUM'), , .T.)
    TRFunction():New(oSection2:Cell('C6_VALOR'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.)

Return oReport

Static Function Imprime(oReport, cAlias)
    Local oSection1 := oReport:Section(1)
    Local oSection2 := oSection1:Section(1)
    Local nTotReg   := 0
    Local cQuery    := GeraQuery()
    Local cUltPed   := ''

    DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oReport:SetMeter(nTotReg)
    oReport:SetTitle('Relatório de Pedidos de Venda')
    oReport:StartPage()

    (cAlias)->(DBGoTop())

    While (cAlias)->(!EoF())
        If AllTrim(cUltPed) <>  Alltrim((cAlias)->(C5_NUM))
            If !Empty(cUltPed)
                oSection2:Finish() //? Finaliza Seção 2
				oSection1:Finish() //? Finaliza Seção 1
				oReport:EndPage()  //? Finaliza página caso queira uma página por pedido de compra
            Endif

            oSection1:Init()

            oSection1:Cell('C5_NUM'):SetValue((cAlias)->(C5_NUM))
            oSection1:Cell('A1_NOME'):SetValue((cAlias)->(A1_NOME))
            oSection1:Cell('C5_EMISSAO'):SetValue((cAlias)->(C5_EMISSAO))
            oSection1:Cell('E4_DESCRI'):SetValue((cAlias)->(E4_DESCRI))
            
            cUltPed := ((cAlias)->(C5_NUM))

            oSection1:Print()
            oSection2:Init()
        Endif

        oSection2:Cell('C6_ITEM'):SetValue((cAlias)->(C6_ITEM))
        oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->(C6_PRODUTO))
        oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->(C6_DESCRI))
        oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->(C6_QTDVEN))
        oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->(C6_PRCVEN))
        oSection2:Cell('C6_VALOR'):SetValue((cAlias)->(C6_VALOR))

        oSection2:PrintLine()
        oReport:IncMeter()

        (cAlias)->(DBSkip())
    Enddo

   	oSection1:Finish()
	oSection2:Finish() 

    (cAlias)->(DBCloseArea())

    oReport:EndPage()
Return

Static Function GeraQuery()
    Local cQuery := ''

    cQuery += 'SELECT PV.C5_NUM, PV.C5_EMISSAO, CLI.A1_NOME, COND.E4_DESCRI, PROD.C6_ITEM, PROD.C6_PRODUTO, PROD.C6_DESCRI, PROD.C6_QTDVEN, PROD.C6_PRCVEN, PROD.C6_VALOR ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' PV' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SE4') + ' COND ON PV.C5_CONDPAG = COND.E4_CODIGO AND COND.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SA1') + ' CLI ON PV.C5_CLIENTE = CLI.A1_COD AND PV.D_E_L_E_T_ = CLI.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SC6') + ' PROD ON PV.C5_NUM = PROD.C6_NUM AND PROD.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += " WHERE PV.D_E_L_E_T_ = ' ' " + CRLF
    cQuery += " AND C5_NUM = '" + Alltrim(SC5->C5_NUM) + "'"

Return cQuery
