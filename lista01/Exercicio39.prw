// 39 - Fa�a um programa que realiza o sorteio de um
// nome. Os nomes contidos no programa devem os
// nomes dos participantes da trilha de capacita��o
// do Projeto Start II.

#INCLUDE "TOTVS.CH"

User Function Ex039()
    local aNomes    := {'Tam�ris','Pintor','Cake','Dani','Giu','Gabriela','Ruan','Quirino','Jo�o','Gustav�o',;
                        'Natan','Ste','Rick','Lucas','F�bio'}
    local nSort  := 0

    nSort := RANDOMIZE(1 , len(aNomes))

    FwAlertSuccess('Quem vai pagar a conta do Outback � o(a): ' + aNomes[nSort])

Return
