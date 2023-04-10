#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function L01E02
    Lista 10 exercício 02
    @type  Function
    @author Matheus Pintor
    @since 06/04/2023
    /*/
User Function L10E02()
    Local cAlias := 'SA2'
    Local cTitle := 'Cadastro de Fornecedores'
    Local oBrowse := FWMBrowse():New() //Criação da tela.

    oBrowse:AddButton('Relatório', {|| PrintForn()})

    oBrowse:SetAlias(cAlias) //Tabela a ser utilizada
    oBrowse:SetDescription(cTitle) //Título
    oBrowse:DisableDetails() //Desabilita os detalhes que ficam embaixo na tela.
    oBrowse:DisableReport()

    oBrowse:Activate() //Ativação da tela, deve ficar por último.
Return 

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.L01E02' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.L01E02' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.L01E02' OPERATION 5 ACCESS 0

Return aRotina

Static Function ModelDef()
    Local oModel        := NIL
    Local oStructureSA2 := NIL

    oModel        := MPFormModel():New('L01E02M')
    oStructureSA2 := FWFormStruct(1, 'SA2') //Pega a estrutura dos campos da tabela com suas propriedades

    oModel:AddFields('SA2MASTER', /*OWNER*/, oStructureSA2)

    oModel:SetDescription('Modelo de Dados de Fornecedores')

    oModel:GetModel('SA2MASTER'):SetDescription('Formulario do Fornecedor')

    oModel:SetPrimaryKey({'SA2_COD'})

Return oModel

Static Function ViewDef()
    Local oModel        := NIL
    Local oStructureSA2 := NIL
    Local oView         := NIL

    oModel := FWLoadModel('L01E02') 
    oStructureSA2 := FWFormStruct(2, 'SA2')//Recebe a visualização dos campos da tabela selecionada
    oView := FWFormView():NEW()

    oView:SetModel(oModel)

    oView:AddField('VIEW_SA2', oStructureSA2 , 'SA2MASTER') //Form
    
    oView:CreateHorizontalBox('TELA', 100) //Div

    oView:SetOwnerView('VIEW_SA2', 'TELA') //Adiciona os campos na tela
Return oView

Static Function PrintForn()
    Local oReport := GeraReport()

    oReport:PrintDialog()
Return 

Static Function GeraReport()
    Local cAlias := GetNextAlias()

    //?Criação do objeto do relatório 
    Local oRel := TReport():New('TREPORT', 'Relatório de Clientes', /**/, {|oRel| Imprime(oRel, cAlias)}, 'Esse relatório imprimirá todos os cadastros de clientes.', .F. /*.T. = Paisagem*/, /*Tot. Text*/, /*Tot. in line*/, /*Page t text*/, /*Tot in line*/, /*Quebra Pag.*/, /*Espaço Coluna*/)
 
    //?Criação do objeto da seção 
    Local oSection := TRSection():New(oRel, 'Cadastros de Clientes')
    
    //? Coluna Código
    TRCell():New(oSection, 'A2_COD', 'SA2', 'Código', /*Picture*/, 8, /*Pixel*/, /*CodBloc*/, 'CENTER', .T., 'CENTER', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 
    
    //? Coluna Razão Social
    TRCell():New(oSection, 'A2_Nome', 'SA2', 'Razão Social', /*Picture*/, 25, /*Pixel*/, /*CodBloc*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 

    //? Coluna Nome Fantasia
    TRCell():New(oSection, 'A2_NREDUZ', 'SA2', 'Nome Fantasia', /*Picture*/, 25, /*Pixel*/, /*CodBloc*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 

    //? Coluna Municipio
    TRCell():New(oSection, 'A2_MUN', 'SA2', 'Município', /*Picture*/, 20, /*Pixel*/, /*CodBloc*/, 'LEFT', .T., 'LEFT', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 

    //? Coluna UF
    TRCell():New(oSection, 'A2_EST', 'SA2', 'UF', /*Picture*/, 8, /*Pixel*/, /*CodBloc*/, 'CENTER', .T., 'CENTER', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 

    //? Coluna CNPJ/CPF
    TRCell():New(oSection, 'A2_CGC', 'SA2', 'CNPJ/CPF', /*Picture*/, 16, /*Pixel*/, /*CodBloc*/, 'LEFT', .F., 'LEFT', /*Compat*/, /*EspacColuna*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.) 

Return oRel

Static Function Imprime(oRel, cAlias)
    Local oSection := oRel:Section(1)
    Local nTotReg  := 0
    Local cQuery   := GeraQuery()

    DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oRel:SetMeter(nTotReg)

    oRel:SetTitle('Relatório de Fornecedores')

    oRel:StartPage()

    oSection:Init()

    (cAlias)->(DbGoTop())

    // While (cAlias)->(!EOF())
    //     If oRel:Cancel()
    //         Exit
    //     Endif

        oSection:Cell('A2_COD'):SetValue((cAlias)->A2_COD)

		oSection:Cell('A2_NOME'):SetValue((cAlias)->A2_NOME)
		
		oSection:Cell('A2_NREDUZ'):SetValue((cAlias)->A2_NREDUZ)
		
		oSection:Cell('A2_MUN'):SetValue((cAlias)->A2_MUN)
		
		oSection:Cell('A2_EST'):SetValue((cAlias)->A2_EST)
		
		oSection:Cell('A2_CGC'):SetValue((cAlias)->A2_CGC)
		
		oSection:PrintLine()

		oRel:ThinLine()

		oRel:IncMeter()

		(cAlias)->(DBSkip())
    // Enddo

	(cAlias)->(DBCloseArea())
	//? Finalizando a impressão da seção
	oSection:Finish()			
	//? Finalizando a página na impressão
	oRel:EndPage()
Return

Static Function GeraQuery()
    Local cQuery := ''

    cQuery += 'SELECT A2_COD, A2_NOME, A2_NREDUZ, A2_MUN, A2_EST, A2_CGC' + CRLF
	cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2' + CRLF
	cQuery += "WHERE A2_COD = '" + Alltrim(SA2->A2_COD) + " ' AND D_E_L_E_T_= ' '" + CRLF
    
Return cQuery
