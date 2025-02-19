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

#Roladem de dados
import random

def get_dados_lados():
    """Prompt usuario para prover o numero de dados para o dado"""
    while True:
        lados = (input("Forneça o tamanho do dado que será rolado (ENTER para sair): "))
        if lados == '':
            break

        if lados.isdigit():
            lados = int(lados)
            if lados > 0:
                return lados
            else:
                print("O número passado deve ser maior que zero!")
        else:
            print("A informação passada não é válida")


def get_qntd_dados():
    """Prompt usuario para prover o numero de dados para serem rolados."""  
    while True:
        qntd_dados = (input("Forneça o número de dados que serão rolados (em branco == 1) : "))
        if qntd_dados == '':
            return 1

        if qntd_dados.isdigit():
            qntd_dados = int(qntd_dados)
            if qntd_dados > 0:
                return qntd_dados
            else:
                print("O número passado deve ser maior que zero!")
        else:
            print("A informação passada não é válida!")


def rolagem_dados():
    """Rola os dados baseado no input do usuario para lados e conta."""
    dados_lados = get_dados_lados()
    resposta = ""

    if dados_lados is not None:
        qntd_dados= get_qntd_dados()
        for num in range(1 , qntd_dados + 1):
            random_dado = random.randint(1, dados_lados)
            print(f"Lançamento n. {num} - {random_dado}")
            resposta += str(random_dado) + " "
        print(f"{qntd_dados} dado(s) de {dados_lados} lados")
        print(resposta)
# Chamar a funcao para rolar os dados
rolagem_dados()
