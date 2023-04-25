#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L11Ex01
    1 � Desenvolva um programa que criar� um
        diret�rio chamado �Lista 13 � Ex1� na pasta
        tempor�ria do Windows.
    @type  Function
    @author Matheus Pintor
    @since 24/04/2023
/*/

User Function L13Ex01()
    Local cCaminho   := GetTempPath()
    Local cNomePasta := 'Lista 13 - Ex1\'
    Local cDelPasta  := ''

    if !ExistDir(cCaminho + cNomePasta) //? Verificando se a pasta j� existe
        if MakeDir(cCaminho + cNomePasta) == 0 //? Criando a pasta
            FwAlertSuccess('Pasta Criada com sucesso!', 'Parab�ns!')
        else
            FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
        endif
    else
        if MsgYesNo('J� existe uma pasta neste local com o nome ' + cNomePasta + ', deseja sobrep�-la?')
            cDelPasta := cCaminho + cNomePasta

            DelPasta(cDelPasta)

                if MakeDir(cCaminho + cNomePasta) == 0
                    FwAlertSuccess('Pasta Criada com sucesso!', 'Parab�ns!')
                else
                    FwAlertError('Houve um erro ao criar a pasta ' + cNomePasta, 'Aten��o')
                endif
        endif
    endif
Return

Static Function DelPasta(cPasta)
    Local aArquivos := Directory(cPasta + '*.*', 'D', , , 1)
    Local nI        := 0
    Local nTamanho  := Len(aArquivos)
    
    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclus�o da pasta anterior?', 'Aten��o!')
            if nTamanho > 0
                for nI := 3 to nTamanho
                   if FErase(cPasta + aArquivos[nI][1]) == -1
                        MsgStop('Houve um erro ao apagar o arquivo ' + aArquivos[nI][1])
                   endif
                next
            endif

            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso!', 'Conclu�do')
            else
                FwAlertError('Houve um erro ao excluir a pasta anterior', 'Erro!')
            endif
        endif
    endif
Return

