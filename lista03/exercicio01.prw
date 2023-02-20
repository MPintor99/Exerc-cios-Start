// 1 – Faça uma consulta na tabela SC7 para retornar
// todos os pedidos realizados para o fornecedor
// “Super Cabos”.
// Apresente o resultado em uma função de mensagem
// com a seguinte estrutura:

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex01SQL()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cPed    := ''
    Local cMsg    := ''
    Local nCont   := 1

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

    cQuery := "SELECT * FROM " + RetSqlName('SC7') + " WHERE C7_FORNECE = 'F00004'"
    
    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    While &(cAlias)->(!EOF())
        cPed  := &(cAlias)->(C7_NUM)


        cMsg += 'Pedido ' + cValToChar(nCont) + ': ' + cPed + CRLF
        cMsg += '--------------------' + CRLF + CRLF

        &(cAlias)->(DbSkip())
        nCont++
    Enddo


        FwAlertInfo(cMsg, 'Pedidos Super Cabos')

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
