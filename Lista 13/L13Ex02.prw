#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L13Ex02
    2 – Escreva um programa para criar um arquivo
    TXT com um texto qualquer e salvar dentro da
    pasta criada no exercício anterior.
    @type Function
    @author Matheus Pintor
    @since 24/04/2023
    /*/
User Function L13Ex02()
    Local cPasta := 'C:\Users\mathe\AppData\Local\Temp\lista 13 - ex1\'
    Local cArquivo := 'L13Ex02.txt'
    Local oWriter := FwFileWriter():New(cPasta + cArquivo, .T.)

    if File(cPasta + cArquivo)
        FwAlertInfo('O arquivo já existe!', 'Atenção!')
    else
        if !oWriter:Create()
            FwAlertError('Houve um erro ao gerar o arquivo!' + CRLF + 'Erro:' + oWriter:Error():Message, 'Erro!')
        else
            oWriter:Write('2 - Escreva um programa para criar um arquivo' + CRLF +  'TXT com um texto qualquer e salvar dentro da' + CRLF + 'pasta criada no exercício anterior.')
            oWriter:Close()

            if MsgYesNo('Arquivo gerado com sucesso! (' + cPasta + cArquivo + ')' + CRLF + 'Deseja abrir o arquivo?', 'Abrir?')
                ShellExecute('OPEN', cArquivo, '', cPasta, 1)
            endif
        endif
    endif
Return
