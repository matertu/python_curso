a1="-"
a2="-"
a3="-"
b1="-"
b2="-"
b3="-"
c1="-"
c2="-"
c3="-"
limpartabuleiro () {
a1="-"
a2="-"
a3="-"
b1="-"
b2="-"
b3="-"
c1="-"
c2="-"
c3="-"
}
verificar_jogada () {
 if [ "$a1" = "X" -a "$a2" = "X" -a "$a3" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi

 if [ "$b1" = "X" -a "$b2" = "X" -a "$b3" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi

 if [ "$c1" = "X" -a "$c2" = "X" -a "$c3" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi

 if [ "$a1" = "X" -a "$b2" = "X" -a "$c3" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi
 if [ "$c1" = "X" -a "$b2" = "X" -a "$a3" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi
 if [ "$a2" = "X" -a "$b2" = "X" -a "$c2" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi
 if [ "$a1" = "X" -a "$b1" = "X" -a "$c1" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi
 if [ "$a3" = "X" -a "$b3" = "X" -a "$c3" = "X" ]; then
    echo "voce venceu"
    sleep 2
    limpartabuleiro
    exibetabuleiro
 fi
}
exibetabuleiro () {
echo "$a3|$b3|$c3"
echo "$a2+$b2+$c2"
echo "$a1|$b1|$c1"
}

while :
do
 clear
 exibetabuleiro
 echo "informe a jogada: "
 read jogada
 if [ "$jogada" = "a1" ]; then
     if [ "$a1" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       a1="X"
       verificar_jogada
     fi
 fi
 if [ "$jogada" = "a2" ]; then
     if [ "$a2" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       a2="X"
       verificar_jogada
     fi
 fi
 if [ "$jogada" = "a3" ]; then
     if [ "$a3" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       a3="X"
       verificar_jogada
     fi 
 fi
 if [ "$jogada" = "b1" ]; then
     if [ "$b1" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       b1="X"
       verificar_jogada
     fi 
 fi
 if [ "$jogada" = "b2" ]; then
      if [ "$b2" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       b2="X"
       verificar_jogada
     fi 
 fi
 if [ "$jogada" = "b3" ]; then
     if [ "$b3" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       b3="X"
       verificar_jogada
     fi 
 fi
if [ "$jogada" = "c1" ]; then
     if [ "$c1" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       c1="X"
       verificar_jogada
     fi 
 fi
if [ "$jogada" = "c2" ]; then
     if [ "$c2" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       c2="X"
       verificar_jogada
     fi 
 fi
if [ "$jogada" = "c3" ]; then
     if [ "$c3" = "X" ]; then
       echo "jogada invalida"
       sleep 2
     else
       c3="X"
       verificar_jogada
     fi 
 fi
done