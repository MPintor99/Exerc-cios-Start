// 19 - Solicite ao usuário que escreva uma frase,
// após isso conte:
// o Quantos espaços em branco existem na frase
// o Quantas vezes cada vogal aparece na frase.
// ? Ex: A: 5, E: 2, I: 2, O: 1, U: 0

#INCLUDE 'TOTVS.CH'

User Function L3Ex19()
    Local aLetras := {{'A', 0},{'E', 0}, {'I', 0}, {'O', 0}, {'U', 0}, {'SPACE', 0}}
    Local cFrase  := ''
    Local nI      := 0

    cFrase := FwInputBox('Insira aqui a frase para ser analisada', cFrase)

    For nI := 1 to Len(cFrase)
        If Upper(SUBSTR(cFrase, nI, 1)) == 'A'
            aLetras[1,2]++
        Elseif Upper(SUBSTR(cFrase, nI, 1)) == 'E'
            aLetras[2,2]++
        Elseif Upper(SUBSTR(cFrase, nI, 1)) == 'I'
            aLetras[3,2]++
        Elseif Upper(SUBSTR(cFrase, nI, 1)) == 'O'
            aLetras[4,2]++
        Elseif Upper(SUBSTR(cFrase, nI, 1)) == 'U'
            aLetras[5,2]++
        Elseif Upper(SUBSTR(cFrase, nI, 1)) == ' '
            aLetras[6,2]++
        Endif
    Next

    FwAlertSuccess('A vogal "A" aparece ' + cValToChar(aLetras[1,2]) + ' vezes' + CRLF +;
    'A vogal "E" aparece ' + cValToChar(aLetras[2,2]) + ' vezes' + CRLF +;
    'A vogal "I" aparece ' + cValToChar(aLetras[3,2]) + ' vezes' + CRLF +;
    'A vogal "O" aparece ' + cValToChar(aLetras[4,2]) + ' vezes' + CRLF +;
    'A vogal "U" aparece ' + cValToChar(aLetras[5,2]) + ' vezes' + CRLF +;
    'existem ' + cValToChar(aLetras[6,2]) + ' espaços em brancos na frase: ' + CRLF + cFrase)
Return
