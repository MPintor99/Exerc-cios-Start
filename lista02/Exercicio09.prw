// 9 - Dado um n�mero de 1 at� 12, apresentar o
// n�mero de dias do m�s correspondente. Se o
// n�mero escolhido for 2 (fevereiro), considere 28
// dias. Dica: O uso de Array pode simplificar as
// coisas, mas n�o � obrigat�rio. ??

#INCLUDE 'TOTVS.CH'

User Function Ex009()
    local aMes      := {'Janeiro', 'Fevereiro', 'Mar�o', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'}
    Local aDias     := {'31','28','31','30','31','30','31','31','30','31','30','31'}
    Local nDia      := 0
    Local cRespDia  := ''
    Local cRespMes  := ''

    While nDia <= 0 .or. nDia > 12//Loop que obriga o usu�rio a colocar um m�s v�lido;
        nDia := Val(FwInputBox('Digite valores de 1 a 12, para ver quantos dias tem o mes correspondente: ', 'Meses'))
    Enddo

    //Strings que ir�o trazer a posi��o dos arrays no m�s escolhido pelo usu�rio.
    cRespDia := aDias[nDia]
    cRespMes := aMes[nDia]

    FwAlertSuccess('O m�s de ' + cRespMes + ' tem ' + cRespDia + ' dias.')

Return
