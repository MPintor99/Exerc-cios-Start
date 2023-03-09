// 3 – Desenvolva uma rotina utilizando um PE para
// que ao incluir ou alterar um Pedido de Venda,
// todos os produtos desse pedido fiquem com a
// observação “Inc. PE - ” antes da descrição.
// o Exemplo:
// ? Item 1: Inc. PE – Creatina
// ? Item 2: Inc. PE – Whey Protein

#INCLUDE 'TOTVS.CH'

User Function MTA120G2()
    Local aArea     := GetArea()
    Local aAreaSC7  := SC7->(GetArea())

    //Atualiza a descrição, com a variável pública criada no ponto de entrada MT120TEL
    SC7->C7_DESCRI := 'Inc. PE ' + Alltrim(SC7->C7_DESCRI)
     
    RestArea(aArea)
    RestArea(aAreaSC7)
Return
