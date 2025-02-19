#ac 6 questao  
import random

contadores = [0, 0, 0, 0, 0, 0]

for _ in range(100):
    resultado = random.randint(1, 6)
    contadores[resultado - 1] += 1

for x, contagem in enumerate(contadores):
    print(f'Número {x + 1}: {contagem} vezes')
 










 #AC 6 QUESTAO 2 

import json

def ler_dados_aluno():
    matricula = input('Digite a matrícula do aluno: ')
    nome = input('Digite o nome do aluno: ')
    email = input('Digite o e-mail do aluno: ')
    return matricula, {"nome": nome, "e-mail": email}


alunos = {}

while True:
    matricula, dados_aluno = ler_dados_aluno()
    alunos[matricula] = dados_aluno
    
    continuar = input('Deseja adicionar outro aluno? (s/n): ')
    if continuar.lower() != 's':
        break

with open('alunos.json', 'w') as arquivo_json:
    json.dump(alunos, arquivo_json, indent=4)

print('Dados dos alunos foram salvos no arquivo alunos.json.')









 #AC  6 QUESTAO 3 

from datetime import datetime

def converter_data(data):
    try:
        data_obj = datetime.strptime(data, '%d/%m/%Y')
     
        meses = ["", "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
       
        data_formatada = f"{data_obj.day} de {meses[data_obj.month]} de {data_obj.year}"
        return data_formatada
    except ValueError:
     
        return None

data_input = input('Digite a data (DD/MM/AAAA): ')
data_formatada = converter_data(data_input)

if data_formatada:
    print(f'Data formatada: {data_formatada}')
else:
    print('Data inválida.')