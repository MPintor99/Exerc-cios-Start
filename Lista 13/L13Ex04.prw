#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L13Ex04
    4 � Escreva um programa que criar� uma pasta
    com o nome �Lista 13� no rootpath
    (protheus_data) e copiar� o arquivo do
    exerc�cio 2 para essa pasta.
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

    if !ExistDir(cCaminho + cNomePasta) //? Verificando se a pasta j� existe
        if MakeDir(cCaminho + cNomePasta) == 0 //? Criando a pasta
            FwAlertSuccess('Pasta Criada com sucesso!', 'Parab�ns!')
        else
            FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
        endif
    else
        if MsgYesNo('J� existe uma pasta neste local com o nome ' + cNomePasta + ', deseja sobrep�-la?')
            if MakeDir(cCaminho + cNomePasta) == 0
                FwAlertSuccess('Pasta Criada com sucesso!', 'Parab�ns!')
            else
                FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
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
        
        FwAlertSuccess('Arquivo(s) copiado(s) com sucesso!', 'Conclu�do!')
    else
        FwAlertInfo('A pasta n�o cont�m nenhum arquivo ou subpasta!', 'Aten��o!')
    endif
Return
