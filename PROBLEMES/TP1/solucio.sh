#!/bin/bash

if [ $# -ne 1 ];
then
    echo "El nombre de paràmetres és incorrecte. S'espera un paràmetre, el nom del fitxer a estudiar."
    exit 1
fi

if [ ! -f $1 ];
then
    echo "El fitxer en qüestió no existeix."
    exit 1
fi
fitxers=($(awk -F';' '{print $1}' $1))
numeros=($(awk -F';' '{print $2}' $1))


for (( i = 0 ; i < ${#fitxers[@]} ; i++ )) ;   
do
    fitxer=${fitxers[$i]}
    n=${numeros[$i]}
    if [ ! -f $fitxer ] 
    then
        echo "$fitxer no existeix o és un directori." ;
    else
        echo "Últimes $n línies del fitxer $fitxer" ;
        tail -n $n $fitxer ;
    fi

done
exit 0
