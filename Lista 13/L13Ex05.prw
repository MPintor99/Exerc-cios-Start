#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function L13Ex05
    5 – Desenvolva um programa para apagar a
    pasta criada no exercício 1.
    @type  Function
    @author Matheus Pintor
    @since 24/04/2023
    /*/

User Function L13Ex05()
    Local cPasta    := GetTempPath() + 'lista 13 - ex1\'
    Local aArquivos := Directory(cPasta + '*.*', 'D', , , 1)
    Local nI        := 0
    Local nTamanho  := Len(aArquivos)
    
    if ExistDir(cPasta)
        if MsgYesNo('Confirma a exclusão da pasta?', 'Atenção!')
            if nTamanho > 0
                for nI := 3 to nTamanho
                   if FErase(cPasta + aArquivos[nI][1]) == -1
                        MsgStop('Houve um erro ao apagar o arquivo ' + aArquivos[nI][1])
                   endif
                next
            endif

            if DirRemove(cPasta)
                FwAlertSuccess('Pasta apagada com sucesso!', 'Concluído')
            else
                FwAlertError('Houve um erro ao excluir a pasta', 'Erro!')
            endif
        endif
    endif
Return
