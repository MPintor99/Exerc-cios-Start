//• 3 - Faça um algoritmo que leia a idade de uma pessoa expressa em anos, meses e dias e escreva a idade dessa pessoa expressa apenas em dias.
//Considerar ano com 365 dias e mês com 30 dias

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function Ex003()
    local cAnos  := ''
    local cMeses := ''
    local cDias  := ''
    local nIdade := 0

    cAnos := FwInputBox('Digite aqui há quantos anos você nasceu.', cAnos)

    While !EHNUMERO(cAnos)
        FwAlertError('Você não colocou um número' , 'Error')
        cAnos := FwInputBox('Digite aqui há quantos anos você nasceu.', cAnos)
    End

    cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu aniversário.', cMeses)

    While !EHNUMERO(cMeses)
        FwAlertError('Você não colocou um número' , 'Error')
        cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu aniversário', cMeses)
    End

    cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesversário', cDias)

    While !EHNUMERO(cDias)
        FwAlertError('Você não colocou um número' , 'Error')
        cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesversário', cDias)
    End

    nIdade := ((Val(cAnos) * 365)+(Val(cMeses)*30)+Val(cDias))

    FwAlertSuccess('Fazem ' + CVALTOCHAR(nIdade) + ' dias desde que você nasceu')
Return
