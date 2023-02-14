#INCLUDE 'TOTVS.CH'

Static Function EHNUMERO(nMSG) //Funcionando

    local nI := 0
    
    IF len(nMSG) < 1
        RETURN .F.
    ENDIF

        FOR nI := 1 to len(nMSG)
            IF !IsDigit(SubStr(nMSG, nI , 1)) .AND. !SubStr(nMSG, nI , 1) == "." .AND. !SubStr(nMSG, nI , 1) == "-"
                RETURN .F.
            ENDIF
        NEXT nI
RETURN .T.

