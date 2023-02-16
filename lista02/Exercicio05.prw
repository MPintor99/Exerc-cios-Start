// • 5 – Elaborar um programa que efetue a
// apresentação do valor da conversão em real (R$)
// de um valor lido em dólar (US$). O programa
// deverá solicitar o valor da cotação do dólar e,
// também, a quantidade de dólares disponível com o
// usuário.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex05()
    Local nCotacaoDolar    := '' 
    Local nQuantidadeDolar := ''
    Local nValorReal       := 0
    Local lContinuar       := .T.
    Local lNum             := .T.

//Loop que fará com que o usuário possa fazer mais de uma conversão.
    DO WHILE lContinuar

        DO WHILE lNum
            If !EHNUMERO(nCotacaoDolar) .or. Val(nCotacaoDolar) <= 0//Função EHNUMERO que faz com que seja digitado realmente um número.
                nCotacaoDolar := FWInputBox('Digite a cotação do dólar:', 'Cotação do dólar')
            Else
                lNum := .F.
            Endif
        Enddo

            lNum := .T. //Redefinição do lNum para .T. para o próximo loop funcionar.

        If !EHNUMERO(nQuantidadeDolar) .or. Val(nCotacaoDolar) <= 0 //Loop de validação de entrada, faz a mesma coisa do loop anterior.
            nQuantidadeDolar := FWInputBox('Digite a quantidade de dólares:', 'Quantidade de dólares')
        Else
            lNum := .F.
        Endif

        nValorReal := Val(nCotacaoDolar) * Val(nQuantidadeDolar)//Aqui é feito o cálculo da cotação.

        MsgInfo('O valor em reais é de R$ ' + Alltrim(STR(nValorReal, 15, 2)))//Utilização da função STR para que o valor fique com ',00'.

        lContinuar := MsgYesNo('Deseja realizar uma nova conversão?', 'Conversor Dólar-Real')//Aqui irá aparecer uma mensagem onde o usuário
    //decide continuar ou não. Caso decida parar o lContinuar vai pra .F. e o loop acaba.

        //Valores serão resetados para que as validações e cálculos funcionem.
        nCotacaoDolar    := ''
        nQuantidadeDolar := ''
    ENDDO

    IF Val(SubStr(Time(), 1, 2)) > 6 .and. Val(SubStr(Time(), 1, 2)) < 12
        FwAlertSuccess('Muito obrigado pela preferência! Tenha um ótimo dia!', 'Obrigado!')
    Elseif Val(SubStr(Time(), 1, 2)) < 18
        FwAlertSuccess('Muito obrigado pela preferência! Tenha uma ótima tarde!', 'Obrigado!')
    Else
        FwAlertSuccess('Muito obrigado pela preferência! Tenha uma ótima noite!', 'Obrigado!')
    Endif
Return

