// 14 � Fa�a uma fun��o que que leia um array de 5
// n�meros inteiros e mostre-os numa string.

#INCLUDE 'TOTVS.CH'

User Function L3Ex14()
    Local aNums   := {}
    Local nNUm    := 0
    Local nI      := 0

    //Loop For que popula o array com os n�meros do usu�rio
    For nI := 1 to 5
        nNum := Val(FwInputBox('Insira aqui um n�mero inteiro para ser armazenado no array'))
        aAdd(aNums, nNum)
    Next

    FwAlertSucces('O n�meros armazenados dentro do array foram: ' + MOSTRAARRAY(aNums), 'N�meros')
Return

Static Function MOSTRAARRAY(aNums)
    Local cMostra := ''
    Local nI      := 0

    //Loop For que concatena os n�meros de array dentro de uma string, poderia ser feito em apenas um loop, por�m n�o acho que se encaixe no enunciado da quest�o que pede uma fun��o que mostre-os numa string.
    For nI := 1 to 5
        If nI < 5
            cMostra += cValToChar(aNums[nI]) + ', '
        Else
            cMostra += cValToChar(aNums[nI]) + '.'
        Endif
    Next 
Return cMostra
