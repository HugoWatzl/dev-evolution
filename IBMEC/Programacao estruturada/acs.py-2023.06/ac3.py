def aumentos( s ):
    if s <= 280 :
        print( "percentual aumentado 20% , ",  "valor aumentado:",   s * 1.2  -s 
              , "novo salário" ,  s * 1.2 )
    elif  s <= 700:
        print("percentual aumentado 15% , " , "valor aumentado:",  s * 1.15 -s  , "novo salário" ,  s * 1.15)
    elif s <= 1500:
        print( "percentual aumentado  10% , " ,"valor aumentado:" ,   s * 1.1 - s, "novo salário", s * 1.1)
    else:
        print( "percentual aumentado  5% , " , "valor aumentado:" ,  s * 0.5 - s , "novo salário" ,  s * 0.5)

s = int(input(" salario atual:"))

print( s )
print(aumentos ( s ))

# #questão 2 
def semana( dia ):
    if dia == 1 :
        print("domingo")
    elif dia == 2 :
        print("segunda")
    elif dia == 3 :
        print("terça")
    elif dia == 4:
        print ("quarta")
    elif dia == 5:
        print("quinta")
    elif dia == 6:
        print("sexta")
    elif dia == 7:
        print("sabado")
    else :
        print("interteminado")

dia = int(input("informe o dia:"))
    
semana( dia )

#questão 3


def calculo( a, b, c) :
    delta = (b ** 2 - 4 * a * c )

    x1 =  ((-b + delta ** 1/2) / 2 * a )

    x2 = ((-b - delta ** 1/2) / 2 * a )
   
    if a == 0:
        print("a equação não é do segundo grau.")
    elif delta < 0 :
        print("a equação não possui raízes reais.")
    elif delta == 0 :
        print("a equação possui apenas uma raiz real" , x1 )
    else:
        print("a equação possui duas raízes reais" , x1 , x2 ) 

a = float(input(" calocar valor de a :"))
b = float(input("calocar valor de b :"))
c = float(input("calocar valor de c :"))

print(calculo ( a, b, c))
