// 14 – Faça uma função que que leia um array de 5
// números inteiros e mostre-os numa string.

#INCLUDE 'TOTVS.CH'

User Function L3Ex14()
    Local aNums   := {}
    Local nNUm    := 0
    Local nI      := 0

    //Loop For que popula o array com os números do usuário
    For nI := 1 to 5
        nNum := Val(FwInputBox('Insira aqui um número inteiro para ser armazenado no array'))
        aAdd(aNums, nNum)
    Next

    FwAlertSucces('O números armazenados dentro do array foram: ' + MOSTRAARRAY(aNums), 'Números')
Return

Static Function MOSTRAARRAY(aNums)
    Local cMostra := ''
    Local nI      := 0

    //Loop For que concatena os números de array dentro de uma string, poderia ser feito em apenas um loop, porém não acho que se encaixe no enunciado da questão que pede uma função que mostre-os numa string.
    For nI := 1 to 5
        If nI < 5
            cMostra += cValToChar(aNums[nI]) + ', '
        Else
            cMostra += cValToChar(aNums[nI]) + '.'
        Endif
    Next 
Return cMostra
