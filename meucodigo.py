import qrcode
nome = input("insira seu nome: ")
email = input("insira seu email: ")
telefone = input("insira seu telefone: ")
msg = nome + "\n" + email + "\n" + telefone
img = qrcode.make(msg)
img.save("msg.png")