"""
AP1-Programação Estruturada

Rolagem de dados
Calculadora CLI

Alunos:
Hugo
João Gabriel Tasca
Vanessa
Marceu
"""

#Calculadora CLI

def soma (a, b):
    return a + b
def subtracao(a, b):
    return a - b
def divisao (a, b):
    return a / b
def multiplicacao (a, b):
    return a * b

def calculadora(numero_retorno, numero_iterador, operacao):
    numero_retorno = float(numero_retorno)
    numero_iterador = float(numero_iterador)
    if operacao == "+":
         numero_retorno = soma(numero_retorno, numero_iterador)
    elif operacao == "-":
        numero_retorno = subtracao(numero_retorno, numero_iterador)
    elif operacao == "*":
        numero_retorno = multiplicacao(numero_retorno, numero_iterador)
    elif operacao == "/":
        numero_retorno = divisao(numero_retorno, numero_iterador)
    return numero_retorno


def calculador(numero1):
    print(numero1)
    numero_inicial = operacao = numero_iterador = input("Informe um número, ou aperte ENTER para sair: ")
    while numero_inicial != "" or numero_iterador != "" or operacao != "":
        operacao = input("Operação (+, -, *, /), X para zerar ou ENTER para sair: ")
        if operacao == "": return
        elif operacao.lower() == "x":
            numero_inicial = 0
            calculador(numero_inicial)
            return

        numero_iterador = input("Informe um número, ou aperte ENTER para sair: ")
        if numero_iterador == "": return
        
        numero_inicial = calculadora(numero_inicial, numero_iterador, operacao)
        print(numero_inicial)
    return

numero = 0.0
calculador(numero)
