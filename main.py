import sqlite3
import hashlib
from fastapi import FastAPI

from pydantic import BaseModel
from typing import Optional, Text

app = FastAPI()

class User(BaseModel):
    nome: Text
    idade: Text

class Valida(BaseModel):
    email: Text
    senha: Text

class Usuario(BaseModel):
    id: int
    nome: Text
    email: Text
    senha: Text
    frase: Text
    status: int

@app.get("/health")
async def health():
    return {"message":"funcionando"}

@app.get("/palmeiras")
async def brasileirao():
    return {"message":"tricampeao"}
    
@app.post("/validar2")
async def validar2(us: User):
   
    atributo=""
    i = int(us.idade)
    if i >=1 and i <= 17:
        atributo="menor de idade"
    elif i >=18 and i < 150:
        atributo="adulto"

    msg = "olá " + us.nome + ", sua idade é " + us.idade + " voce é " + atributo
    return {"message":msg}
    
@app.post("/inserir")
async def inserir(us: Usuario):
    x = us.senha + us.frase
    s = hashlib.sha512(x.encode("utf-8")).hexdigest()
    r = True
    c = sqlite3.connect("turma2.db")
    cr = c.cursor()
    cr.execute(""" insert into usuario (id,nome,email,senha,frase,status) values (?,?,?,?,?,?)""",(us.id,us.nome,us.email,s,us.frase,us.status))
    c.commit()
    c.close()
    return {"message": r}

@app.get("/ler")
async def ler(id: int):
    c = sqlite3.connect("turma2.db")
    cr = c.cursor()
    cr.execute(""" select * from usuario where id = ? """,(id,))
    linha = cr.fetchall()
    return {"message": linha}

@app.put("/alterar")
async def alterar(id: int, nome: str):
    c = sqlite3.connect("turma2.db")
    cr = c.cursor()
    cr.execute("""update usuario set nome = ? where id = ?""",(nome,id))
    c.commit()
    return {"message":"ok"}

@app.post("/validar")
async def validar(us: Valida):
    r = False
    c = sqlite3.connect("turma2.db")
    cr = c.cursor()
    cr.execute(""" select id,email,senha,status from usuario where email = ? and senha = ? and status = 1 """,(us.email,us.senha))
    for linha in cr.fetchall():
        r = True
    return {"message": r}

@app.post("/ativar")
async def ativar(id: int):
    c = sqlite3.connect("turma2.db")
    cr = c.cursor()
    cr.execute("""update usuario set status = 1 where id = ?""",(id,))
    c.commit()
    return {"message":"ok"}

@app.post("/desativar")
async def desativar(id: int):
    c = sqlite3.connect("turma2.db")
    cr = c.cursor()
    cr.execute("""update usuario set status = 0 where id = ?""",(id,))
    c.commit()
    return {"message":"ok"}

@app.post("/alterar senha")
async def ativar(id: int, senha: str, frase: str):
    x = senha + frase
    s = hashlib.sha512(x.encode("utf-8")).hexdigest()
    c = sqlite3.connect("turma2.db")
    cr = c.cursor()
    cr.execute(""" update usuario set senha = ?, frase = ? where id = ?""",(s,frase,id))
    c.commit()
    return {"message":"ok"}





