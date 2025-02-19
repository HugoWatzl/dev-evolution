# questao 1 ac4


def e_primo( num ):
    for div in range(2 , num ):
        if num % div == 0:
            print("o numero não e primo:")
            break
    else :
        print("o  numero e primo")


num = int(input("coloque o numero :"))

print( e_primo( num ))


#############################################################
# ac 4 questão 3
_0_25 = 0
_26_50 = 0
_51_75 = 0
_76_100 = 0

while True:
    n = int(input("Coloque um numero positivo:"))
    
    if n < 0:
        break
    
    if 0 <= n <= 25:
        _0_25 += 1
    elif 26 <= n <= 50:
        _26_50 += 1
    elif 51 <= n <= 75:
        _51_75 += 1
    elif 76 <= n <= 100:
        _76_100 += 1

print("Quantidade de números nos intervalos:")
print( _0_25 )
print(_26_50 )
print( _51_75 )
print( _76_100 ) 