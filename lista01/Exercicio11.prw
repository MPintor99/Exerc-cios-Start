//11 - Ler 3 valores, cada um representando as
// medidas dos lados de um triângulo e escrever se
// formam ou não um triângulo. OBS: para formar um
// triângulo, o valor de cada lado deve ser menor que
// a soma dos outros 2 lados.

#INCLUDE 'TOTVS.CH'

User Function Ex011()
    Local cA := ''
    Local cB := ''
    Local cC := ''

    cA := FwInputBox('Insira aqui o tamanho do lado A do triângulo', cA)
        cA := Val(cA)

    cB := FwInputBox('Insira aqui o tamanho do lado B do triângulo', cB)
        cB := Val(cB)

    cC := FwInputBox('Insira aqui o tamanho do lado C do triângulo', cC)
        cC := Val(cC)

    if cA >= cB + cC .OR. cB >= cA + cC .OR. cC >= cA + cB
        FwAlertInfo('Os valores inseridos não constam como um triângulo.')
    else
        FwAlertInfo('Os valores inseridos constam como um triângulo.')
    endif

Return
