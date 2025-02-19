def salario( horas , numero ):

    num = horas * numero 
    return num 

horas = float(input("salario por hora de :"))
numero = float(input("numero de horas trabalhadas no mes foi de :"))

num2 = salario( horas , numero )
print("o salario a receber e de :" , num2 )