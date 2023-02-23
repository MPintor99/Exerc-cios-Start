// 9 � Desenvolva uma rotina em que, com base em um
// c�digo de produto informado pelo usu�rio, retorne
// todos os pedidos de venda em que esse produto
// est� sendo usado.
// Obs: Os n�meros dos pedidos devem estar
// separados por v�rgula.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

User Function L3Ex09SQL()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''
    Local cMsg    := ''
    lOCAL cCod    := ''

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'
    
    cCod := FwInputBox('Insira aqui o c�digo do produto.', cCod)

    cQuery := "SELECT " + CRLF
    cQuery += "     C6_NUM " + CRLF
    cQuery += "     ,C6_PRODUTO " + CRLF
    cQuery += "FROM " + RetSqlName('SC6') +  CRLF
    cQuery += "WHERE C6_PRODUTO = '" + cCod + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())


    While &(cAlias)->(!EOF())
       
            cMsg += ALLTRIM(&(cAlias)->(C6_NUM)) + ', '

        &(cAlias)->(DbSkip())
    Enddo

        FwAlertInfo(cMsg, 'Pedidos de compra do produto' + cCod, cCod)

    &(cAlias)->(DbCloseArea())
    RestArea(aArea)
Return 
