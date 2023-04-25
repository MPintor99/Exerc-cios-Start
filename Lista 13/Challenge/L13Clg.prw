#INCLUDE 'TOTVS.CH'
#INCLUDE 'REPORT.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function l13clg
    Challenge Lista 13
    @type  Function
    @author Matheus Pintor
    @since 24/04/2023
    /*/
User Function l13Clg()
    Local oReport
    Private cPedido   := ''
    Private aTxt      := {}

    CriaPasta()

    oReport := Gerareport()

    oReport:PrintDialog()

    CriaLog()
Return

Static Function GeraReport()
    Local cAlias := GetNextAlias()
    Local oBreak

    AADD(aTxt, 'Instanciado a classe de impressão: ' + Time() + ';')
    //! Instanciando a classe de impresão
    Local oReport	:= TReport():New('TReport', 'Relatório de Pedidos de Venda',,{|oReport| Imprime(oReport, cAlias)}, 'Infomações de Pedidos de Compra',.F.,,,, .T., .T.)	
    
    Local oSection1 := TRSection():New(oReport, 'Pedidos de Venda Cadastrados',,, .F., .T.)
    Local oSection2 := TRSection():New(oSection1, 'Itens do Pedido',,,.F.,.T.)

    AADD(aTxt, 'Criando a seção 1 "Pedido de venda": ' + Time() + ';')
    //! Seção 1
    //? Pedido de Venda
    TRCell():New(oSection1, 'C5_NUM', 'SC5', 'Nº Pedido', /*Picture*/, 8, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection1, 'A1_NOME', 'SA1', 'Nome Cliente', /*Picture*/, 30, /*Pixel*/,  /*Code-Bloc*/, 'LEFT', .T., 'LEFT', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection1, 'C5_EMISSAO', 'SC5', 'Data Emissão', /*Picture*/, 14, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection1, 'E4_DESCRI', 'SE4', 'Cond. Pagamento', /*Picture*/, 15, /*Pixel*/,  /*Code-Bloc*/, 'LEFT', .T., 'LEFT', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)

    AADD(aTxt, 'Criando a seção 2 "Itens do Pedido": ' + Time() + ';')
    //! Seção 2
    //? Itens do Pedido
    TRCell():New(oSection2, 'C6_ITEM', 'SC6', 'Nº Item', /*Picture*/, 8, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_PRODUTO', 'SC6', 'Código do Produto', /*Picture*/, 8, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_DESCRI', 'SC6', 'Descrição do Produto', /*Picture*/, 30, /*Pixel*/,  /*Code-Bloc*/, 'LEFT', .T., 'LEFT', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_QTDVEN', 'SC6', 'Quantidade Vendida', /*Picture*/, 4, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_PRCVEN', 'SC6', 'Valor Unitário', /*Picture*/, 10, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)
    TRCell():New(oSection2, 'C6_VALOR', 'SC6', 'Valor Total', /*Picture*/, 10, /*Pixel*/,  /*Code-Bloc*/, 'CENTER', .T., 'CENTER', /*Comp.*/, /*Espaço Entre Cel.*/, .T., /*Cor Fundo*/, /*Cor Fonte*/, .T.)

    AADD(aTxt, 'Criando o Totalizador: ' + Time() + ';')
    oBreak := TRBreak():New(oSection1, oSection1:Cell('C5_NUM'), , .T.)
    TRFunction():New(oSection2:Cell('C6_VALOR'), 'VALTOT', 'SUM', oBreak, 'VALOR TOTAL',,, .F., .F., .F.)

Return oReport

Static Function Imprime(oReport, cAlias)
    local oSection1 := oReport:Section(1)
    local oSection2 := oSection1:Section(1)
    local nTotReg   := 0
    local cUProd    := ''
    local cQuery    := GeraQuery()
    // local nCont := 1

    AADD(aTxt, 'Início da impressão do relatóio: ' + Time() + ';')
    AADD(aTxt, ' ;')

    DBUseArea(.T., 'TOPCONN', TcGenQry(/*Compat*/, /*Compat*/, cQuery), cAlias, .T., .T.)

    Count TO nTotReg

    oReport:SetMeter(nTotReg)
    oReport:SetTitle('Relatório de Pedidos de Vendas')
    oReport:StartPage()

    (cAlias)->(DbGoTop())

    while (cAlias)->(!EOF())
        if oReport:Cancel()
            exit 
        endif 

        if AllTrim(cUProd) != AllTrim((cAlias)->(C5_NUM))
            if !Empty(cUProd)
                oSection2:Finish()
                oSection1:Finish()
                oReport:EndPage()
            endif 

            oSection1:Init()

            oSection1:Cell('C5_NUM'):SetValue((cAlias)->(C5_NUM))
            AADD(aTxt, 'Número do Pedido: ' +  (cAlias)->(C5_NUM) + ';')

            oSection1:Cell('A1_NOME'):SetValue((cAlias)->(A1_NOME))
            AADD(aTxt, 'Cliente: ' +  (cAlias)->(A1_NOME) + ';')

            oSection1:Cell('C5_EMISSAO'):SetValue(DtoC(StoD((cAlias)->C5_EMISSAO)))
            AADD(aTxt, 'Data Emissão: ' +  DtoC(StoD((cAlias)->C5_EMISSAO)) + ';')

            oSection1:Cell('E4_DESCRI'):SetValue((cAlias)->(E4_DESCRI))
            AADD(aTxt, 'Condição de pagamento: ' +  (cAlias)->(E4_DESCRI) + ';')

            cUProd := ((cAlias)->(C5_NUM))
            cPedido := cUProd

            oSection1:PrintLine()

            oSection2:Init()

        endif   

            oSection2:Cell('C6_ITEM'):SetValue((cAlias)->(C6_ITEM))
            AADD(aTxt, 'Item: ' + (cAlias)->(C6_ITEM) + ';')

            oSection2:Cell('C6_PRODUTO'):SetValue((cAlias)->(C6_PRODUTO))
            AADD(aTxt, 'Produto: ' + (cAlias)->(C6_PRODUTO) + ';')

            oSection2:Cell('C6_DESCRI'):SetValue((cAlias)->(C6_DESCRI))
            AADD(aTxt, 'Descrição: ' + (cAlias)->(C6_DESCRI) + ';')

            oSection2:Cell('C6_QTDVEN'):SetValue((cAlias)->(C6_QTDVEN))
            AADD(aTxt, 'Quantidade: ' + cValToChar((cAlias)->(C6_QTDVEN)) + ';')
            
            oSection2:Cell('C6_PRCVEN'):SetValue((cAlias)->(C6_PRCVEN))
            AADD(aTxt, 'Preço: R$ ' + cValToChar((cAlias)->(C6_PRCVEN)) + ';')

            oSection2:Cell('C6_VALOR'):SetValue((cAlias)->(C6_VALOR))
            AADD(aTxt, 'Valor Total: R$ ' + cValToChar((cAlias)->(C6_VALOR)) + ';')

            AADD(aTxt, ' ;')

            oSection2:PrintLine()
            oReport:SkipLine(1)

            oReport:IncMeter()

            (cAlias)->(DbSkip())
    enddo

    oReport:SetReportPortal("Nome_do_arquivo") // DEFINE O NOME DO RELATÓRIO

    AADD(aTxt, 'Fim da criação do relatório: ' + Time() + ';')

    oSection2:Finish()
    oReport:SkipLine(1)
    oSection1:Finish()

    (cAlias)->(DbCloseArea())

    oReport:EndPage()
Return

Static Function GeraQuery()
    local cQuery := ''

    cQuery := 'SELECT PV.C5_NUM, PV.C5_EMISSAO,CLI.A1_NOME,COND.E4_DESCRI, PROD.C6_ITEM, PROD.C6_PRODUTO, PROD.C6_DESCRI, PROD.C6_QTDVEN, PROD.C6_PRCVEN, PROD.C6_VALOR ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' PV' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SE4') + ' COND ON PV.C5_CONDPAG = COND.E4_CODIGO AND COND.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SA1') + ' CLI ON PV.C5_CLIENTE = CLI.A1_COD AND PV.D_E_L_E_T_ = CLI.D_E_L_E_T_ ' + CRLF
    cQuery += ' INNER JOIN ' + RetSqlName('SC6') + ' PROD ON PV.C5_NUM = PROD.C6_NUM AND PROD.D_E_L_E_T_ = PV.D_E_L_E_T_ ' + CRLF
    cQuery += " WHERE PV.D_E_L_E_T_ = ' ' "
    cQuery += " AND C5_NUM = '" + AllTrim(M->C5_NUM) + " '"

Return cQuery

Static Function CriaPasta()
    Local cCaminho   := '\'
    Local cNomePasta := 'Pedidos de Venda\'
    Local cDelPasta  := ''

    if !ExistDir(cCaminho + cNomePasta) //? Verificando se a pasta já existe
        if MakeDir(cCaminho + cNomePasta) == 0 //? Criando a pasta
            FwAlertSuccess('Pasta Criada com sucesso!', 'Parabéns!')
        else
            FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Atenção')
        endif
    else
        if MsgYesNo('Já existe uma pasta neste local com o nome ' + cNomePasta + ', deseja sobrepô-la?')
            cDelPasta := cCaminho + cNomePasta

            DelPasta(cDelPasta)

                if MakeDir(cCaminho + cNomePasta) == 0
                    FwAlertSuccess('Pasta Criada com sucesso!', 'Parabéns!')
                else
                    FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Atenção')
                endif
        endif
    endif
Return

Static Function CriaLog()
    Local cPasta := '\Pedidos de Venda\'
    Local cArquivo := 'Log' + cPedido
    Local oWriter := FwFileWriter():New(cPasta + cArquivo, .T.)
    Local cLog    := ARRTOKSTR(aTxt, CRLF)

    if File(cPasta + cArquivo)
        FwAlertInfo('O arquivo já existe!', 'Atenção!')
    else
        if !oWriter:Create()
            FwAlertError('Houve um erro ao gerar o arquivo!' + CRLF + 'Erro:' + oWriter:Error():Message, 'Erro!')
        else
            oWriter:Write(cLog)
            oWriter:Close()

            if MsgYesNo('Arquivo gerado com sucesso! (' + cPasta + cArquivo + ')' + CRLF + 'Deseja abrir o arquivo?', 'Abrir?')
                ShellExecute('OPEN', cArquivo + '.txt', '', cPasta, 1)
            endif
        endif
    endif
Return

Static Function DelPasta(cPasta)
    Local aArquivos := Directory(cPasta + '*.*', 'D', , , 1)
    Local nI        := 0
    Local nTamanho  := Len(aArquivos)
    
    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclusão da pasta anterior?', 'Atenção!')
            if nTamanho > 0
                for nI := 3 to nTamanho
                   if FErase(cPasta + aArquivos[nI][1]) == -1
                        MsgStop('Houve um erro ao apagar o arquivo ' + aArquivos[nI][1])
                   endif
                next
            endif

            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso!', 'Concluído')
            else
                FwAlertError('Houve um erro ao excluir a pasta', 'Erro!')
            endif
        endif
    endif
Return
