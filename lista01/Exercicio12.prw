// 12 - Ler o nome de 2 times e o número de gols
// marcados na partida (para cada time). Escrever o
// nome do vencedor. Caso não haja vencedor
// deverá ser impressa a palavra EMPATE.

#INCLUDE 'TOTVS.CH'

User Function Ex012()
    Local cTime1 := ''
    Local cTime2 := ''
    Local cP1    := ''
    Local cP2    := ''

    cTime1 := FwInputBox('Digite aqui o nome do primeiro time', cTime1)
    cP1 := FwInputBox('Digite aqui os pontos do primeiro time', cP1)

    cTime2 := FwInputBox('Digite aqui o nome do segundo time', cTime2)
    cP2 := FwInputBox('Digite aqui os pontos do segundo time', cP2)

    If cP1 > cP2
        FwAlertInfo('O time ' + cTime1 + ' venceu!') 
    elseif cP1 < cP2
        FwAlertInfo('O time ' + cTime2 + ' venceu!') 
    Else
        FwAlertInfo('EMPATE') 
    Endif
Return
