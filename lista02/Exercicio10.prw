// 10 - Efetuar a leitura de 5 valores inteiros e exibir
// na tela o menor e o maior deles.

User function L2Ex10()
    Local aVal := {0,0,0,0,0}
    Local nMenor := 0
    Local nMaior := 0
    Local nI     := 0

    // Efetua a leitura dos 5 valores
    for nI := 1 to 5
        aVal[nI] := val(FwInputBox('Digite o ' + alltrim(str(nI)) + 'º valor:', 'Entrada de Dados'))
    Next

    // Ordena o array em ordem crescente
    asort(aVal)

    // Obtém o menor e o maior valor, com a primeira e última posição
    nMenor := aVal[1]
    nMaior := aVal[5]

    // Exibe o resultado na tela
    FwAlertSuccess('O menor valor é: ' + alltrim(str(nMenor)) + CRLF + ;
        'O maior valor é: ' + alltrim(str(nMaior)), 'Feito')
return
