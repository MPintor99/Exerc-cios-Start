// 13 - Faça um algoritmo para ler: a descrição do produto (nome), a quantidade adquirida e o preço unitário.
// Calcular e escrever o total (total = quantidade adquirida * preço unitário), o desconto e o total a pagar (total a pagar = total - desconto),
// sabendo-se que:
// o Se quantidade <= 5 o desconto será de 2%
// o Se quantidade > 5 e quantidade <= 10 o
// desconto será de 3%
// o Se quantidade > 10 o desconto será de 5%

#INCLUDE 'TOTVS.CH'

User Function Ex013()
    Local cNOme := ''
    Local cValor := ''
    Local cQuant := ''

    cNOme := FwInputBox('Insira aqui o nome do seu produto', cNome)
    cValor := FwInputBox('Insira aqui o valor unitário do seu produto', cValor)
    cQuant :=  FwInputBox('Insira aqui a quantidade deste produto que você comprou', cQuant)
Return
