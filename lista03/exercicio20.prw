// 20 – Lembra do campo B1_ZZGRP que criamos há
// algum tempo? Pois é, vamos utilizar ele agora!

#INCLUDE 'TOTVS.CH'

User Function L3Ex20()
    Local cMsg := ""

    if M->B1_TIPO == "MP"
        cMsg := "MATERIA PRIMA PRODUCAO"

    elseif M->B1_TIPO == "PA"
        cMsg := "PRODUTO PARA COMERCIALIZACAO"
        
    else    
        cMsg := "OUTROS PRODUTOS"
    endif
Return cMsg
