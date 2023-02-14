// • 8 - A jornada de trabalho semanal de um
// funcionário é de 40 horas. O funcionário que
// trabalhar mais de 40 horas receberá hora extra,
// cujo cálculo é o valor da hora regular com um
// acréscimo de 50%.
// Escreva um algoritmo que leia o número de horas
// trabalhadas em um mês, o salário por hora e
// escreva o salário total do funcionário, que deverá
// ser acrescido das horas extras, caso tenham sido
// trabalhadas (considere que o mês possua 4
// semanas exatas).

#INCLUDE 'TOTVS.CH'

User Function Ex008()
    Local cHoraReg    := ''
    Local cSemana     := ''
    Local nBancoHoras := 0
    Local nHoraExtra  := 0
    Local nSalario    := 0
    Local nI          := 0

    cHoraReg := FwInputBox('Coloque aqui quanto o funcionário recebe por hora: ', cHoraReg)

    For nI := 1 TO 4
        cSemana := FwInputBox('Coloque aqui quanto o funcionario trabalhou na ' + cValToChar(nI) + 'ª semana', cSemana)
        nBancoHoras+= Val(cSemana)
    Next

    If nBancoHoras > 160
        nHoraExtra := (nBancoHoras - 160)*(Val(cHoraReg)*1.5)
        nSalario := (nBancoHoras*Val(cHoraReg)) + nHoraExtra

        FwAlertInfo('O salário do funcionário é: R$' + cValToChar(NoRound(nSalario,2)) + CRLF + 'Onde ele recebeu de hora extra: R$' + cValToChar(NoRound(nHoraExtra,2)))
    Else
        nSalario := (nBancoHoras*Val(cHoraReg))
        FwAlertInfo('O salário do funcionário é: R$' + cValToChar(NoRound(nSalario,2)))
    Endif
        
    
Return
