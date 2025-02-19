#AC 5 QUESTAO 1 
def piramide(n):
    for x in range(1, n + 1):
        print(*range(1, x + 1))

n = int(input("Digite um número: "))

piramide(n)



#ac 5 quessao  2
def cont_digitos(x):
    return len(str(x))

x = int(input("insira um numero : "))

print(cont_digitos( x ))

#questao  3 ac 5 

try:
    n1 = int(input('Digite um número: '))
    n2 = int(input('Digite outro número: '))
    div = n1 / n2
except ValueError:
    print("Erro na digitação dos números.")
except ZeroDivisionError:
    print("Erro: Divisão por zero!")
else:
    print("Divisão =", div)

finally:
    print(" Fim .")