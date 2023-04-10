#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'
#INCLUDE 'TOPCONN.CH'

/*/{Protheus.doc} User Function L10E04
    Exerc�cio 05 lista 10
    @type  Function
    @author Matheus Pintor
    @since 10/04/2023
/*/
User Function L10E05()
	Local oReport := GeraReport() 
	
 	oReport:PrintDialog()
Return

Static Function GeraReport()
	Local cAlias	:= GetNextAlias() 
	
	//? Instanciando a classe de impress�o.
	Local oReport	:= TReport():New('TReport', 'Relat�rio de Pedidos de Compra',,{|oReport| Imprime(oReport, cAlias)}, 'Infoma��es de Pedidos de Compra',.F.,,,, .T., .T.)	
	//? Instanciando a classe de Se��o.
	Local oSection1	:= TRSection():New(oReport, "Pedidos de Compra cadastrados",,,.F.,.T.)
    Local oSection2 := TRSection():New(oSection1, "Itens do Pedido de Compra",,,.F.,.T.)		
	
    //? Se��o 1
    //! Pedido de Compra
	TRCell():New(oSection1, 'C7_NUM', 'SC7', 'N� Pedido', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_EMISSAO', 'SC7', 'Data de Emissao', /*Picture*/, 14, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection1, 'C7_FORNECE', 'SC7', 'Fornecedor', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'C7_LOJA', 'SC7', 'Loja', /*Picture*/, 5, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection1, 'C7_COND', 'SC7', 'Condicao de pagamento', /*Picture*/, 5, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	
    //? Se��o 2
    //! Itens do Pedido
    TRCell():New(oSection2, 'C7_PRODUTO', 'SC7', 'Cod. Produto', /*Picture*/, 8, /*Pixel*/, /*Code-Block*/, 'CENTER', .T., 'CENTER', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_DESCRI', 'SC7', 'Descricao do Produto', /*Picture*/, 30, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
	TRCell():New(oSection2, 'C7_QUANT', 'SC7', 'Quantidade Vendida', /*Picture*/, 4, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C7_PRECO', 'SC7', 'Valor Unitario', /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)	
	TRCell():New(oSection2, 'C7_TOTAL', 'SC7', 'Valor Total', /*Picture*/, 10, /*Pixel*/, /*Code-Block*/, 'LEFT', .T., 'LEFT', /*Comp.*/,/*Espac. Entre Cel.*/, .T., /*Cor Fundo*/, /**Cor Fonte*/, .T.)
Return oReport

Static Function Imprime(oReport, cAlias)
	Local oSection1     := oReport:Section(1)
    Local oSection2     := oSection1:Section(1)  
	Local nTotReg		:= 0
	Local cQuery		:= GeraQuery()

	DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

	Count TO nTotReg 

	oReport:SetMeter(nTotReg)
	oReport:SetTitle('Relat�rio de Pedidos de Compra')  

	(cAlias)->(DBGoTop())

	while (cAlias)->(!EoF())
			oSection1:Init()
			oReport:StartPage()	
			oSection1:Cell('C7_NUM'):SetValue((cAlias)->C7_NUM)
			oSection1:Cell('C7_EMISSAO'):SetValue((cAlias)->C7_EMISSAO)	
			oSection1:Cell('C7_FORNECE'):SetValue((cAlias)->C7_FORNECE)		
			oSection1:Cell('C7_LOJA'):SetValue((cAlias)->C7_LOJA)	
			oSection1:Cell('C7_COND'):SetValue((cAlias)->C7_COND)

			oSection1:PrintLine()
			oSection1:Finish()
            oSection2:Init()
            
            oSection2:Cell('C7_PRODUTO'):SetValue((cAlias)->C7_PRODUTO)
            oSection2:Cell('C7_DESCRI'):SetValue((cAlias)->C7_DESCRI)	
            oSection2:Cell('C7_QUANT'):SetValue((cAlias)->C7_QUANT)		
            oSection2:Cell('C7_PRECO'):SetValue((cAlias)->C7_PRECO)	
            oSection2:Cell('C7_TOTAL'):SetValue((cAlias)->C7_TOTAL)
            
            oSection2:PrintLine()
            oReport:IncMeter()

		(cAlias)->(DBSkip())
	enddo   
	
	(cAlias)->(DBCloseArea())
    oSection2:Finish()	
				
	oReport:EndPage()
Return  

//? Consuta SQL.
Static Function GeraQuery()
	Local cQuery := ''
	cQuery += 'SELECT C7_NUM, C7_EMISSAO, C7_FORNECE, C7_LOJA, C7_COND, C7_PRODUTO, C7_DESCRI, C7_QUANT, C7_PRECO, C7_TOTAL' + CRLF
	cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7' + CRLF
	cQuery += "WHERE D_E_L_E_T_= ' '"
Return cQuery
