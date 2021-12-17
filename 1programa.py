idade= input("insira sua idade (digite apenas numeros)")

try:
    i = int(idade)
    if i <= 9:
        print("crianca")
    elif i >=10 and i <= 13:
        print("pre adolescente")
    elif i >=14 and i <= 17:
        print("adolescente")
    elif i >= 18 and i <= 59:
        print("adulto")
    elif i >=60 and i < 150:
        print("idoso")
    else:
        print("Idade nao prevista")
except ValueError:
     print("idade invalida, tente novamente")



