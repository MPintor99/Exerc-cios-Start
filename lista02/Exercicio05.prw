// � 5 � Elaborar um programa que efetue a
// apresenta��o do valor da convers�o em real (R$)
// de um valor lido em d�lar (US$). O programa
// dever� solicitar o valor da cota��o do d�lar e,
// tamb�m, a quantidade de d�lares dispon�vel com o
// usu�rio.

#INCLUDE 'TOTVS.CH'
#INCLUDE 'liblista01.prw'

User Function L2Ex05()
    Local nCotacaoDolar    := '' 
    Local nQuantidadeDolar := ''
    Local nValorReal       := 0
    Local lContinuar       := .T.
    Local lNum             := .T.

//Loop que far� com que o usu�rio possa fazer mais de uma convers�o.
    DO WHILE lContinuar

        DO WHILE lNum
            If !EHNUMERO(nCotacaoDolar) .or. Val(nCotacaoDolar) <= 0//Fun��o EHNUMERO que faz com que seja digitado realmente um n�mero.
                nCotacaoDolar := FWInputBox('Digite a cota��o do d�lar:', 'Cota��o do d�lar')
            Else
                lNum := .F.
            Endif
        Enddo

            lNum := .T. //Redefini��o do lNum para .T. para o pr�ximo loop funcionar.

        If !EHNUMERO(nQuantidadeDolar) .or. Val(nCotacaoDolar) <= 0 //Loop de valida��o de entrada, faz a mesma coisa do loop anterior.
            nQuantidadeDolar := FWInputBox('Digite a quantidade de d�lares:', 'Quantidade de d�lares')
        Else
            lNum := .F.
        Endif

        nValorReal := Val(nCotacaoDolar) * Val(nQuantidadeDolar)//Aqui � feito o c�lculo da cota��o.

        MsgInfo('O valor em reais � de R$ ' + Alltrim(STR(nValorReal, 15, 2)))//Utiliza��o da fun��o STR para que o valor fique com ',00'.

        lContinuar := MsgYesNo('Deseja realizar uma nova convers�o?', 'Conversor D�lar-Real')//Aqui ir� aparecer uma mensagem onde o usu�rio
    //decide continuar ou n�o. Caso decida parar o lContinuar vai pra .F. e o loop acaba.

        //Valores ser�o resetados para que as valida��es e c�lculos funcionem.
        nCotacaoDolar    := ''
        nQuantidadeDolar := ''
    ENDDO

    IF Val(SubStr(Time(), 1, 2)) > 6 .and. Val(SubStr(Time(), 1, 2)) < 12
        FwAlertSuccess('Muito obrigado pela prefer�ncia! Tenha um �timo dia!', 'Obrigado!')
    Elseif Val(SubStr(Time(), 1, 2)) < 18
        FwAlertSuccess('Muito obrigado pela prefer�ncia! Tenha uma �tima tarde!', 'Obrigado!')
    Else
        FwAlertSuccess('Muito obrigado pela prefer�ncia! Tenha uma �tima noite!', 'Obrigado!')
    Endif
Return

