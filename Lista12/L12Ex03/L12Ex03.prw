#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'
#INCLUDE 'TOPCONN.CH'

#DEFINE LEFT      1
#DEFINE CENTER    2
#DEFINE RIGHT     3
#DEFINE GERAL     1

/*/{Protheus.doc} User Function L12Ex03
    Adicione um novo botão a essa rotina. Ao acionar esse
    botão deverá ser gerada uma planilha com todos os
    cursos e seus respectivos alunos.
    @type  Function
    @author Matheus Pintor
    @since 20/04/2023
    /*/
User Function L12Ex03()
    Local cAlias := Geracons()

    GeraPlan(cAlias)
Return


Static Function Geracons()
    Local aArea   := GetArea()
    Local cAlias  := GetNextAlias()
    Local cQuery  := ''

    cQuery := 'SELECT ZZC.ZZC_COD, ZZC.ZZC_CURSO, ZZX.ZZX_COD, ZZX.ZZX_CURSO, ZZX.ZZX_NOME, ZZX.ZZX_DTINIC ' + CRLF
    cQuery += 'FROM ' + RetSqlName("ZZC") + " ZZC " + CRLF
    cQuery += " INNER JOIN " + RetSqlName("ZZX") + " ZZX " + CRLF
    cQuery += " ON ZZC.ZZC_COD = ZZX.ZZX_CURSO AND ZZX.D_E_L_E_T_ = ZZC.D_E_L_E_T_ 
    cQuery += "WHERE ZZX.D_E_L_E_T_ = ' '"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    if (cAlias)->(EOF())
       cAlias := '' 
    endif

    RestArea(aArea)
Return cAlias

Static Function GeraPlan(cAlias)
    Local oExcel       := FwMsExcelEx():New() //! Instanciando a classe para criação da Planilha
    Local cPath        := GetTempPath()
    Local cArq         := 'L12Ex03.xls'
    Local cCurso       := ' '
    Local cCodCurso    := ' '

    DbSelectArea(cAlias)
    (cAlias)->(DbGoTop())

    While (cAlias)->(!EOF())
        If cCodCurso != ((cAlias)->(ZZC_COD))
            cCurso := Alltrim((cAlias)->(ZZC_CURSO))

            oExcel:AddWorkSheet(cCurso)

            oExcel:AddTable(cCurso, 'Alunos do Curso')

            oExcel:AddColumn(cCurso, 'Alunos do Curso', 'Codigo', LEFT, GERAL)
            oExcel:AddColumn(cCurso, 'Alunos do Curso', 'Nome', LEFT, GERAL)
            oExcel:AddColumn(cCurso, 'Alunos do Curso', 'Data de Início', LEFT, GERAL)
        Endif

        //? Adicionando linhas com dados em cada coluna
            oExcel:AddRow(cCurso, 'Alunos do Curso', {AllTrim((cAlias)->(ZZX_COD)), AllTrim((cAlias)->(ZZX_NOME)), StoD((cAlias)->(ZZX_DTINIC))})

        cCodCurso := ((cAlias)->(ZZC_COD))

        DbSkip()
    Enddo

    //? Alterando estilos do título da planilha
    oExcel:SetTitleFont('Times New Roman')
    oExcel:SetTitleSizeFont(14)
    oExcel:SetTitleBold(.T.)
    //   oExcel:SetTitleBgColor('#FFFFFF')
    //   oExcel:SetTitleFrColor('#000000')

    //? Alterando estilos do cabeçalho das colunas
    oExcel:SetHeaderFont('Times New Roman')
    oExcel:SetHeaderSizeFont(12)
    oExcel:SetHeaderBold(.T.)
    //   oExcel:SetBgColorHeader('#550099')
    //   oExcel:SetFrColorHeader('#FFFFFF')

        //? Ativando a classe
    oExcel:Activate()

    //? Gerando arquivo físico
    oExcel:GetXMLFile(cPath + cArq)

    //? Verifica se tem o Excel instalado no PC
    if ApOleClient('MsExcel')
        oExec := MsExcel():New()

        oExec:WorkBooks:Open(cPath + cArq)
        
        oExec:SetVisible(.T.)

        oExec:Destroy()
    else
        cMsg := 'Microsoft Excel não encontrado!' + CRLF

        cMsg += 'Arquivo salvo em: ' + cPath + cArq

        FwAlertError(cMsg, 'Atenção!')
    endif

    //? Desativando a classe
    oExcel:DeActivate()
Return
