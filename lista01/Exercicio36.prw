// 36 - Fa�a um programa para calcular n! (Fatorial
// de n), sendo que o valor inteiro de n � fornecido
// pelo usu�rio. Sabe-se que: 4! = 4 * 3 * 2 * 1

#INCLUDE 'TOTVS.CH'

User function Ex036()
    Local nNum    := 0
    Local nI      := 0
    Local nResult := 0

    nNum := Val(FwInputBox('Digite aqui um n�mero para saber seu fatorial.')) 

    nResult := nNum

    For nI := nNUm to 2 step -1

            nResult := nResult * (nI-1)
    NEXT

    if nNum == 0
        FwAlertSuccess('O resultado de ' + cValToChar(nNum) + '! �: 1')
    else 
        FwAlertSuccess('O resultado de ' + cValToChar(nNum) + '! �: ' + cValToChar(nResult))
    endif

RETURN
