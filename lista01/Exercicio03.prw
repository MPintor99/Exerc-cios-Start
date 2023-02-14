//� 3 - Fa�a um algoritmo que leia a idade de uma pessoa expressa em anos, meses e dias e escreva a idade dessa pessoa expressa apenas em dias.
//Considerar ano com 365 dias e m�s com 30 dias

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function Ex003()
    local cAnos  := ''
    local cMeses := ''
    local cDias  := ''
    local nIdade := 0

    cAnos := FwInputBox('Digite aqui h� quantos anos voc� nasceu.', cAnos)

    While !EHNUMERO(cAnos)
        FwAlertError('Voc� n�o colocou um n�mero' , 'Error')
        cAnos := FwInputBox('Digite aqui h� quantos anos voc� nasceu.', cAnos)
    End

    cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu anivers�rio.', cMeses)

    While !EHNUMERO(cMeses)
        FwAlertError('Voc� n�o colocou um n�mero' , 'Error')
        cMeses := FwInputBox('Digite aqui quantos meses fazem desde seu anivers�rio', cMeses)
    End

    cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesvers�rio', cDias)

    While !EHNUMERO(cDias)
        FwAlertError('Voc� n�o colocou um n�mero' , 'Error')
        cDias := FwInputBox('Digite aqui quantos dias fazem desde o seu mesvers�rio', cDias)
    End

    nIdade := ((Val(cAnos) * 365)+(Val(cMeses)*30)+Val(cDias))

    FwAlertSuccess('Fazem ' + CVALTOCHAR(nIdade) + ' dias desde que voc� nasceu')
Return
