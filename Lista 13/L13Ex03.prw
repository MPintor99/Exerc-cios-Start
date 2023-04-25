#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L13Ex03
    Exemplo de leitura de arquivo txt
    @type  Function
    @author Matheus Pintor
    @since 24/04/2023
    /*/
User Function L13Ex03()
    local cPasta    := 'C:\Users\mathe\AppData\Local\Temp\'
    local cArquivo  := 'L13Ex02.txt'
    local cTxtLinha := ''
    local oArq      := FwFileReader():New(cPasta + cArquivo)

    // verifica se foi poss�vel abrir o arquivo
    if oArq:Open()
        if !oArq:EOF() //verifica se est� no fim do arquivo
            while oArq:HasLine() //verifica se tem linhas
                cTxtLinha += oArq:GetLine(.T.) //coloca as linhas na vari�vel cTxtLinha
            enddo
        endif
        oArq:Close() //fecha o arquivo
    endif

    FwAlertInfo(cTxtLinha, 'Conte�do do Arquivo:')

Return
