// 14 - Faça um programa que calcule a somatória dos
// "n" primeiros números naturais pares ou ímpares.
// O usuário informará através de digitação a
// quantidade de números desejada ("n") e escolherá
// entre par ou ímpar.

#INCLUDE 'TOTVS.CH'

User function L2Ex14()

    Local nI := 0
    Local nN := 0
    Local aTipo := {'Impares', 'Pares'}
    Local nTipo := 0
    Local nSoma := 0
    
    //Aqui o usuário escolhe quantos números ele deseja que sejam somados.
    nN := val(FwInputBox('Digite a quantidade de números desejada:'))

    //Aqui o usuário decide se os números somados serão pares ou ímpares
    nTipo := Aviso('Escolha o tipo de número:', 'Faça sua escolha', aTipo, 1)

    if nTipo == 1
        for nI := 1 to nN step 2 //Aqui são somados apenas os números ímpares.
            nSoma += nI
        next
    else
        for nI := 2 to nN  step 2//Aqui, somente os pares
            nSoma += nI
        next
    endif

    FwAlertSuccess('A soma dos ' + cValToChar(nN) + ' primeiros números ' + aTipo[nTipo] + ' é: ' + cValToChar(nSoma))

return
