#iNCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MYMVC_2
    Exemplo MVC
    @type  Function
    @author Matheus Pintor
    @since 20/03/2023
*/
User Function MYMVC_2()
    Local cAlias  := 'ZZC'
    Local cTitle   := 'Cursos'
    Local oBrowse  := FwMbrowse():New()

    oBrowse:SetAlias(cAlias) //Seleciona a tabela que será utilizada

    oBrowse:SetDescription(cTitle) //Seleciona o título

    oBrowse:DisableDetails() //Retira os detalhes embaixo no Browse

    oBrowse:DisableReport() //Retira o botão para imprimir o Browse

    oBrowse:AddButton("Relatório Excel"	, { || U_L12Ex03()})
    
    oBrowse:Activate() //Ativa o Browse

    
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Olhar'     ACTION 'VIEWDEF.MYMVC_2' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE 'Cadastrar' ACTION 'VIEWDEF.MYMVC_2' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Mudar'     ACTION 'VIEWDEF.MYMVC_2' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Deletar'   ACTION 'VIEWDEF.MYMVC_2' OPERATION 5 ACCESS 0
Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MYMVC_2M')
    Local oStruZZC := FWFormStruct(1, 'ZZC')
    Local oStruZZX := FWFormStruct(1, 'ZZX')
    Local aGatilho := FWStruTrigger('ZZX_COD', 'ZZX_NOME', 'ZZE->ZZE_ALUNO', .T., 'ZZE', 1, 'xFilial("ZZE")+Alltrim(M->ZZX_COD)')

    oStruZZX:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    oModel:AddFields('ZZCMASTER', /*COMPONENTE PAI*/, oStruZZC)

    oModel:AddGrid('ZZXDETAIL', 'ZZCMASTER', oStruZZX) //Linkando a grid ao componente pai

    oModel:SetDescription('Cursos')
    oModel:GetModel('ZZCMASTER'):SetDescription('Cursos')

    oModel:GetModel('ZZXDETAIL'):SetDescription('Alunos')

    oModel:SetRelation('ZZXDETAIL', {{'ZZX_FILIAL', 'xFilial("ZZX")'},{'ZZX_CURSO', 'ZZC_COD'}}, ZZX->(IndexKey(1))) //Aqui uma tabela é atrelada com a outra, ZZX com ZZC

    oModel:SetPrimaryKey({'ZZC_COD', 'ZZX_COD'}) //Demonstra como os campos serão organizados, tipo índice
Return oModel

Static Function ViewDef() //Função de visualização de tela
    Local oModel   := FwLoadModel('MYMVC_2') //Faz o Load do modelo do arquivo fonte
    Local oStruZZC := FWFormStruct(2, 'ZZC') //Faz as estruturas, porém o 2 faz com que sirva apenas para visualização
    Local oStruZZX := FWFormStruct(2, 'ZZX')
    Local oView    := FwFormView():New() //Instanciando a Classe da Tela, criando objeto onde será a tela

    oView:SetModel(oModel) //Vincula o modelo carregado com o objeto criado
    oView:AddField('VIEW_ZZC', oStruZZC, 'ZZCMASTER') //Vincula o componente visual de formulário com o componente de formulário do componente de dados (ModelDef)
   
    oView:AddGrid('VIEW_ZZX', oStruZZX, 'ZZXDETAIL') //Vincula a Grid ao ZZXDETAIL
   
    oView:CreateHorizontalBox('CURSO', 30) //Cria uma caixa horizontal onde o primeiro campo define o nome e o segundo a % de tela que será ocupada
    
    oView:CreateHorizontalBox('ALUNOS', 70)
    
    oView:SetOwnerView('VIEW_ZZC', 'CURSO') //Demonstra a quem essa view pertence
    oView:SetOwnerView('VIEW_ZZX', 'ALUNOS') //Demonstra a quem essa view pertence

    oView:EnableTitleView('VIEW_ZZX', 'Alunos Matriculados')
    oView:EnableTitleView('VIEW_ZZC', 'Dados do Curso')

    oView:SetViewAction('BUTTONOK', {|oView| MostrarMsg(oView)})

    oView:SetFieldAction('ZZC_COD', {|oView| CarregaNome(oView)})

    oView:AddUserButton('Um Botão', 'CLIPS', {|| , FwAlertInfo('Pronto! Botão Criado!', 'Essa é a mensagem!')}, 'Botão de Mensagem', /*nShortCut*/, {MODEL_OPERATION_INSERT, MODEL_OPERATION_UPDATE})

    oView:AddOtherObject('BOTAO', {|oPanel| Clique(oPanel)})
    oView:SetOwnerView('BOTAO', 'CURSO')

Return oView

Static Function Clique(oPanel)
    TButton():New(005, 001, 'Clique Aqui', oPanel, {|| FwAlertSuccess('Você clicou!', 'Parabéns')}, 050, 020)
Return


Static Function MostrarMsg(oView)
    Local nOper  := oView:GetOperation()
    Local cCurso := oView:GetValue('ZZCMASTER', 'ZZC_CURSO')
    Local cLinhas := cValToChar(oView:GetModel('ZZXDETAIL'):Length(.T.))

    If nOper == 3
        FwAlertSuccess('Inclusão do curso <b>' + cCurso + '</b> realizada com sucesso!', 'SetViewAction')
    Elseif nOper == 4
        FwAlertInfo('Alteração do curso <b>' + cCurso + '</b> realizada com sucesso!', 'SetViewAction')
    Elseif nOper == 5
        FwAlertError('Exclusão do curso <b>' + cCurso + '</b> realizada com sucesso!', 'SetViewAction')
    Endif

    FwAlertInfo('Existem ' + cLinhas + ' linhas no Grid.')
Return

Static Function CarregaNome(oView)
    Local cNome  := 'Curso'
    Local oModel := oView:GetModel('ZZCMASTER')

    oModel:SetValue('ZZC_CURSO', cNome)

    oView:Refresh()
Return
