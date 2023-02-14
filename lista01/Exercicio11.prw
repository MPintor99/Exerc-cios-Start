//11 - Ler 3 valores, cada um representando as
// medidas dos lados de um tri�ngulo e escrever se
// formam ou n�o um tri�ngulo. OBS: para formar um
// tri�ngulo, o valor de cada lado deve ser menor que
// a soma dos outros 2 lados.

#INCLUDE 'TOTVS.CH'

User Function Ex011()
    Local cA := ''
    Local cB := ''
    Local cC := ''

    cA := FwInputBox('Insira aqui o tamanho do lado A do tri�ngulo', cA)
        cA := Val(cA)

    cB := FwInputBox('Insira aqui o tamanho do lado B do tri�ngulo', cB)
        cB := Val(cB)

    cC := FwInputBox('Insira aqui o tamanho do lado C do tri�ngulo', cC)
        cC := Val(cC)

    if cA >= cB + cC .OR. cB >= cA + cC .OR. cC >= cA + cB
        FwAlertInfo('Os valores inseridos n�o constam como um tri�ngulo.')
    else
        FwAlertInfo('Os valores inseridos constam como um tri�ngulo.')
    endif

Return
