// 28 - Escreva um algoritmo que permita a leitura
// dos nomes de 10 pessoas e armazene os nomes
// lidos em um array. Após isto, o algoritmo deve
// permitir a leitura de mais 1 nome qualquer de
// pessoa e depois escrever a mensagem ACHEI, se o
// nome estiver entre os 10 nomes lidos
// anteriormente (guardados no array), ou NÃO ACHEI
// caso contrário.

#INCLUDE 'TOTVS.CH'

User function Ex028()
    Local aNomes := {}
    Local cNome  := ''
    Local cFind  := ''
    Local nI     := 1

    for nI := 1 to 3
        cNome := FwInputBox('Digite o nome que será armazenado.', cNome)
        aADD(aNomes,cNome)
        cNome := ''
    next

    cFind := FwInputBox('Digite um nome para pesquisar', cFind)

    if AScan(aNomes, cFind) != 0
        FwAlertSuccess('ACHEI!')
    else
        FwAlertError('NÃO ACHEI.')
    endif
return
