#INCLUDE 'TOTVS.CH'

User Function ManuCad()
    Local aArea := GetArea()
     
    RecLock('SB1', .F.)
        SB1->B1_DESC := 'Cad. Manual - ' + M->B1_DESC
        SB1->B1_MSBLQL := '1'
    SB1->(MsUnlock())
     
    RestArea(aArea)
Return

User Function ValidaExc()
    Local aArea := GetArea()
    Local lRet  := .T.

    IF Alltrim(C5_TIPOINC) == 'AUTOMÁTICO'
        lRet := .F.

        FwAlertError('Pedidos automáticos não podem ser excluidos', 'NÃO PERMITIDO')

    Endif

    RestArea(aArea)
Return lRet

User Function BloqCli()
    Local aArea := GetArea()
     
    RecLock('SA1', .F.)
        SA1->A1_MSBLQL := '1'
    SA1->(MsUnlock())
     
    RestArea(aArea)
Return
