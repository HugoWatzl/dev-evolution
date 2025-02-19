a = float(input(" calocar valor de a :"))
b = float(input("calocar valor de b :"))
c = float(input("calocar valor de c :"))

 # variante delta

delta = (b ** 2 - 4 * a * c )

#variante baskara

num1 = ((-b + delta ** 1/2) / 2 * a )

num = ((-b - delta ** 1/2) / 2 * a )

print(num , num1)

################################


ano = int(input("informe o ano :"))

#ano bissexto
#multiplo de 4

b4 = ( ano % 4 == True)

#anos múltiplos de 100 que não são múltiplos de 400 não são bissextos

num = (ano % 100 != True and ano % 400 != True)

print(b4)