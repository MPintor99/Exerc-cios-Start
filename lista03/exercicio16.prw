// � 16 � Crie uma fun��o que permita ao usu�rio digitar
// o seu nome e em seguida mostre-o de tr�s para
// frente utilizando apenas letras mai�sculas.
// � Exemplo:
// o Usu�rio digita o nome �Maria�
// o Dever� ser apresentado: �AIRAM�

#INCLUDE 'TOTVS.CH'

User Function L3Ex16()
    Local cNome   := ''
    Local cMostra := ''
    Local nI      := 0

    cNome := FwInputBox('Digite aqui seu nome', cNome)

    //Neste loop ele ir� percorrer o nome todo de tr�s pra frente e concaten�-lo ao contr�rio em cMostra
    For nI := Len(cNome) to 1 Step -1
        cMostra += Substr(cNome, nI, 1)
    Next

    FwAlertSucces('Seu nome ao contr�rio �: ' + Upper(cMostra), 'Ol�, ' + Upper(cMostra))

Return 
