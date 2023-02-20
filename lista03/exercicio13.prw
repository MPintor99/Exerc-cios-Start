// 13 – Desenvolva uma função que leia um número e
// exiba o dia da semana correspondente, por
// exemplo:
// 1 – Domingo
// 2 – Segunda...

#INCLUDE 'TOTVS.CH'

User Function L3Ex13()
    Local aDias := {'Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'}
    Local nDia  := 0

    //Parte em que o usuário irá escolher qual número gostaria de saber o dia da semana correspondente
    nDia := Val(FwInputBox('Escreva aqui um número de 1 a 7 para saber qual dia da semana é vinculado a ele: '))

    FwAlertSucces('O dia correspondente ao número ' + cValToChar(nDia) + ' é: ' + aDias[nDIa], aDias[nDia])

Return
