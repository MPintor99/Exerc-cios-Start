// 13 � Desenvolva uma fun��o que leia um n�mero e
// exiba o dia da semana correspondente, por
// exemplo:
// 1 � Domingo
// 2 � Segunda...

#INCLUDE 'TOTVS.CH'

User Function L3Ex13()
    Local aDias := {'Domingo', 'Segunda-feira', 'Ter�a-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'S�bado'}
    Local nDia  := 0

    //Parte em que o usu�rio ir� escolher qual n�mero gostaria de saber o dia da semana correspondente
    nDia := Val(FwInputBox('Escreva aqui um n�mero de 1 a 7 para saber qual dia da semana � vinculado a ele: '))

    FwAlertSucces('O dia correspondente ao n�mero ' + cValToChar(nDia) + ' �: ' + aDias[nDIa], aDias[nDia])

Return
