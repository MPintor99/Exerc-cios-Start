// 9 - Dado um número de 1 até 12, apresentar o
// número de dias do mês correspondente. Se o
// número escolhido for 2 (fevereiro), considere 28
// dias. Dica: O uso de Array pode simplificar as
// coisas, mas não é obrigatório. ??

#INCLUDE 'TOTVS.CH'

User Function Ex009()
    local aMes      := {'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'}
    Local aDias     := {'31','28','31','30','31','30','31','31','30','31','30','31'}
    Local nDia      := 0
    Local cRespDia  := ''
    Local cRespMes  := ''

    While nDia <= 0 .or. nDia > 12//Loop que obriga o usuário a colocar um mês válido;
        nDia := Val(FwInputBox('Digite valores de 1 a 12, para ver quantos dias tem o mes correspondente: ', 'Meses'))
    Enddo

    //Strings que irão trazer a posição dos arrays no mês escolhido pelo usuário.
    cRespDia := aDias[nDia]
    cRespMes := aMes[nDia]

    FwAlertSuccess('O mês de ' + cRespMes + ' tem ' + cRespDia + ' dias.')

Return
