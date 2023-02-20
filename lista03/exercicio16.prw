// • 16 – Crie uma função que permita ao usuário digitar
// o seu nome e em seguida mostre-o de trás para
// frente utilizando apenas letras maiúsculas.
// • Exemplo:
// o Usuário digita o nome “Maria”
// o Deverá ser apresentado: “AIRAM”

#INCLUDE 'TOTVS.CH'

User Function L3Ex16()
    Local cNome   := ''
    Local cMostra := ''
    Local nI      := 0

    cNome := FwInputBox('Digite aqui seu nome', cNome)

    //Neste loop ele irá percorrer o nome todo de trás pra frente e concatená-lo ao contrário em cMostra
    For nI := Len(cNome) to 1 Step -1
        cMostra += Substr(cNome, nI, 1)
    Next

    FwAlertSucces('Seu nome ao contrário é: ' + Upper(cMostra), 'Olá, ' + Upper(cMostra))

Return 
