// 7 - Ler a hora de início e a hora de fim de um jogo
// de Poker (considere apenas horas inteiras, sem os
// minutos) e calcule a duração do jogo em horas,
// sabendo-se que o tempo máximo de duração do
// jogo é de 24 horas e que o jogo pode iniciar em um
// dia e terminar no dia seguinte.

#INCLUDE 'TOTVS.CH'

User Function L2Ex07()
   Local nHoraI := 0
   Local nHoraF := 0
   Local Total  := 0

    //Aqui coletamos as informações fornecidas pelo usuário.
    nHoraI := Val(FwInputBox('Digite a hora que comecou o jogo de poker. '))
    nHoraF := Val(FwInputBox('Digite a hora que acabou o jogo de poker. '))

    //Cálculo que irá ver quantas horas durou o jogo.
    Total := nHoraI - nHoraF

    if nHoraI >= nHoraF
        Total := ( nHoraF - nHoraI ) + 24 //Caso a hora inicial seja menor que a final, adicionamos +24 horas pois, entende-se que o jogo durou mais de um dia.
        FwAlertSuccess('O jogo levou ' + alltrim(Str(Total)) + ' horas.', 'Resultado')
    else
        Total := ( nHoraF - nHoraI )
        FwAlertSuccess('O jogo levou ' + alltrim(Str(Total)) + ' horas.', 'Resultado')
    ENDIF

Return
