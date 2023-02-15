// 39 - Faça um programa que realiza o sorteio de um
// nome. Os nomes contidos no programa devem os
// nomes dos participantes da trilha de capacitação
// do Projeto Start II.

#INCLUDE "TOTVS.CH"

User Function Ex039()
    local aNomes    := {'Tamíris','Pintor','Cake','Dani','Giu','Gabriela','Ruan','Quirino','João','Gustavão',;
                        'Natan','Ste','Rick','Lucas','Fábio'}
    local nSort  := 0

    nSort := RANDOMIZE(1 , len(aNomes))

    FwAlertSuccess('Quem vai pagar a conta do Outback é o(a): ' + aNomes[nSort])

Return
