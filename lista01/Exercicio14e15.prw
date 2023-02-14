//  • 14 - Escreva um algoritmo para ler 2 valores e se o
//  segundo valor informado for ZERO, deve ser lido
//  um novo valor, ou seja, para o segundo valor não
//  pode ser aceito o valor zero. Imprimir o resultado
//  da divisão do primeiro valor lido pelo segundo
//  valor lido.
//  • 15 - Acrescentar uma mensagem de 'VALOR
//  INVÁLIDO' no exercício anterior caso o segundo
//  valor informado seja ZERO.

#INCLUDE 'TOTVS.CH'

User Function Ex014e015()

    local cNum     := ''
    local nNum1     := 0
    local nNum2     := 0
    local nDiv      := 0
    local lLoop     := .T.

    cNum := FwInputBox('Digite o primeiro número: ', cNum)
    nNum1 := val(cNum)

    While lLoop

        cNum := FwInputBox("Digite o segundo número: ", cNum)

        if val(cNum) == 0
            MsgStop('Não se pode dividir por zero!!')
            loop 
        else
            nNum2 := val(cNum)
            lLoop := .F.
        endif

    End while

    nDiv := nNum1 / nNum2 

    FwAlertInfo(cvaltochar(nNum1) + " / " + cvaltochar(nNum2) + " = " + cvaltochar(nDiv), "Divisão")
    
Return 
