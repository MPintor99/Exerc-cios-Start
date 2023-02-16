// 15 - Fazer um programa para calcular e exibir os "n" primeiros números da série de Fibonacci.
// O usuário informará o valor de n.

#INCLUDE "TOTVS.CH"

User Function L2Ex15()
    nNum   := 0

    //Aqui o usuário escolhe quantos números serão gerados.
    nNum := FwInputBox('Digite quantos números da série Fibonacci quer ver: ')
        nNum:= val(nNum)

    CalcFib(nNum)

Return

//Função que irá realizar o cálcul dos números da série de Fibonacci de acordo com a quantidade informada pelo usuário acima.
Static Function CalcFib(nNum)
    local nA    := 0
    local nB    := 1
    local nC    := 0
    local nCont := 1
    local aC    := {}
    local cShow := ""

    if nNum = 0
        FwAlertSuccess("Os números da série Fibonacci é: " + alltrim(Str(nA)))

    elseif  nNum = 1
        FwAlertSuccess("Os números da série Fibonacci é: " + alltrim(Str(nB)))
    
    else
        while (nCont < nNum)
            nC := nA + nB
            nA := nB
            nB := nC

            AADD(aC, nC)

            cShow += (' , ' + Alltrim(STR(aC[nCont])))

            nCont++ 
        enddo 
    endif


    FwAlertSuccess('Os números da série fibonacci são: 0 , 1' + cShow)

Return
