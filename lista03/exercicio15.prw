// 15 - Desenvolva um programa que receba a
// temperatura média de cada mês do ano e
// armazene-as em um array. Após isso, calcule a
// média de temperatura anual e mostre todas as
// temperaturas acima da média anual e em que mês
// ocorreram exemplo:
// Média Anual: 28 Graus
// Fevereiro: 29 Graus
// Novembro: 31 Graus

#INCLUDE 'TOTVS.CH'

User Function L3Ex15()
    Local aMes      := {'Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'}
    Local aTemp     := {}
    Local nTemp     := 0
    Local nMedia    := 0
    Local nSoma     := 0
    Local nCont     := 1
    Local cShow     := ''
    Local nI        := 0


    for nCont := 1 to 12  //Conta até 12 para preencher as temperaturas médias;
        nTemp := (FwInputBox('Digite a temperatura média do mês de ' + aMes[nCont] + ': '))
            nTemp := val(nTemp)
            aADD(aTemp , nTemp) //Insere os valores digitados na array.

            nSoma += nTemp
    next

    nMedia := nSoma / 12

    for nI := 1 to 12 //Percorre a array de temperatura procurando as temperaturas mais altas que a média.
        if aTemp[nI] > nMedia
            cShow += ('  ' + aMes[nI] + ' ' +  Alltrim(STR(aTemp[nI])) + CRLF) //Armazena a temperatura mais alta e o mês correspondente em uma string.
        endif
    next

    FwAlertSuccess('A temperatura média desse ano foi : ' + cValToChar(nMedia) + CRLF + ;
    'Os meses com temperatura acima da média foram: ' + cShow) //Mostra para o usuário a média anual e os meses com temperatura acima da média.

Return
