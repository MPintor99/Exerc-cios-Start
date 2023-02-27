#INCLUDE 'TOTVS.CH'

User Function Ex01a05()
    Local cAlias      := 'SA1'
    Private cCadastro := 'Meus clientes'
    Private aRotina   := {}

    Aadd(aRotina, {'Exercicio 01', '', 0, 6})
    Aadd(aRotina, {'Exercicio 02', '', 0, 6})
    Aadd(aRotina, {'Exercicio 03', '', 0, 6})
    Aadd(aRotina, {'Exercicio 04', '', 0, 6})
    Aadd(aRotina, {'Exercicio 05', '', 0, 6})


    DbSelectArea('SA1')
    DbSetOrder(1)

    MBrowse(NIL, NIL, NIL, NIL, cAlias)

    DbCloseArea()
Return
