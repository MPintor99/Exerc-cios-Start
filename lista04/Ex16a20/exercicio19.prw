// 19 � Altere a rotina do exerc�cio anterior para que
// n�o seja poss�vel excluir um curso cadastrado.


#INCLUDE 'TOTVS.CH'

User Function CadZZE()

    Local cAlias := 'ZZE', cTitulo := 'Cadastro de alunos '
    Local lVldAlt := 'U_VldAlt()'

    DbSelectArea(cAlias)
    DbSetOrder(1)
    AxCadastro(cAlias, cTitulo, lVldAlt, NIL)

Return
