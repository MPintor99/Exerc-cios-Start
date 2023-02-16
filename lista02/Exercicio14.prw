// 14 - Fa�a um programa que calcule a somat�ria dos
// "n" primeiros n�meros naturais pares ou �mpares.
// O usu�rio informar� atrav�s de digita��o a
// quantidade de n�meros desejada ("n") e escolher�
// entre par ou �mpar.

#INCLUDE 'TOTVS.CH'

User function L2Ex14()

    Local nI := 0
    Local nN := 0
    Local aTipo := {'Impares', 'Pares'}
    Local nTipo := 0
    Local nSoma := 0
    
    //Aqui o usu�rio escolhe quantos n�meros ele deseja que sejam somados.
    nN := val(FwInputBox('Digite a quantidade de n�meros desejada:'))

    //Aqui o usu�rio decide se os n�meros somados ser�o pares ou �mpares
    nTipo := Aviso('Escolha o tipo de n�mero:', 'Fa�a sua escolha', aTipo, 1)

    if nTipo == 1
        for nI := 1 to nN step 2 //Aqui s�o somados apenas os n�meros �mpares.
            nSoma += nI
        next
    else
        for nI := 2 to nN  step 2//Aqui, somente os pares
            nSoma += nI
        next
    endif

    FwAlertSuccess('A soma dos ' + cValToChar(nN) + ' primeiros n�meros ' + aTipo[nTipo] + ' �: ' + cValToChar(nSoma))

return
