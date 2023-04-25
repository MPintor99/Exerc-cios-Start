#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L13Ex04
    4 – Escreva um programa que criará uma pasta
    com o nome “Lista 13” no rootpath
    (protheus_data) e copiará o arquivo do
    exercício 2 para essa pasta.
    @type  Function
    @author Matheus Pintor
    @since 24/04/2023
    /*/
User Function L13Ex04()
    Criapasta()

    CopiaArq()
Return 

Static Function CriaPasta()
    Local cCaminho   := '\'
    Local cNomePasta := 'Lista 13'

    if !ExistDir(cCaminho + cNomePasta) //? Verificando se a pasta já existe
        if MakeDir(cCaminho + cNomePasta) == 0 //? Criando a pasta
            FwAlertSuccess('Pasta Criada com sucesso!', 'Parabéns!')
        else
            FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Atenção')
        endif
    else
        if MsgYesNo('Já existe uma pasta neste local com o nome ' + cNomePasta + ', deseja sobrepô-la?')
            if MakeDir(cCaminho + cNomePasta) == 0
                FwAlertSuccess('Pasta Criada com sucesso!', 'Parabéns!')
            else
                FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Atenção')
            endif
        endif
    endif
Return

Static Function CopiaArq()
    Local cPastaOri  := 'C:\Users\mathe\AppData\Local\Temp\lista 13 - ex1\'
    Local cPastaDest := '\lista 13\'
    Local aArquivos  := Directory(cPastaOri + '*.*', 'D', , , 1)
    Local nI         := 0
    Local nTamanho   := LEN(aArquivos)

    if nTamanho > 0
        for nI := 3 to nTamanho
            if !CPYT2S(cPastaOri + aArquivos[nI][1], cPastaDest)
                MsgStop('Houve um erro ao copiar o arquivo!' + aArquivos[nI][1])
            endif
        next
        
        FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Concluído!')
    else
        FwAlertInfo('A pasta não contém nenhum arquivo ou subpasta!', 'Atenção!')
    endif
Return
