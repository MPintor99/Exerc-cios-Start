#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

/*/{Protheus.doc} User Function Ex1L14
    Programa que executa uma rotina automática para cadastrar um cliente.
    @type  Function
    @author Matheus Pintor
    @since 19/05/2023
    /*/
User Function L14Ex01()
    local aDados    := {}
    local nOper     := 3  

    private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    aAdd(aDados, {'A1_FILIAL'   , xFilial('SA1')    , NIL})  
    aAdd(aDados, {'A1_COD'      , 'TESTE'          , NIL})  
    aAdd(aDados, {'A1_LOJA'     , '01'              , NIL})  
    aAdd(aDados, {'A1_NOME'     , 'TESTE TESTE'   , NIL})  
    aAdd(aDados, {'A1_NREDUZ'   , 'TESTE 2'        , NIL})  
    aAdd(aDados, {'A1_TIPO'     , 'F'               , NIL})  
    aAdd(aDados, {'A1_END'      , 'RUA DO TESTE'  , NIL})  
    aAdd(aDados, {'A1_EST'      , 'SP'              , NIL})  
    aAdd(aDados, {'A1_MUN'      , 'MOGI GUAÇU'         , NIL})  

    MsExecAuto({|x, y| CRMA980(x, y)}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif
Return
