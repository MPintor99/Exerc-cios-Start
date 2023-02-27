// 19 – Altere a rotina do exercício anterior para que
// não seja possível excluir um curso cadastrado.


#INCLUDE 'TOTVS.CH'

User Function CadZZE()

    Local cAlias := 'ZZE', cTitulo := 'Cadastro de alunos '

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, .F., NIL)

Return
