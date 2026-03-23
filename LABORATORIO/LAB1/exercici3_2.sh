#!/bin/bash

if [ $# -ne 1 ];
then 
    echo "S'esperava un fixer d'entrada per a poder fer-ne resum"
    exit 1
fi

echo "Fitxer: $1" >>resum_alerta.txt
echo "Paisos en alerta: $(awk 'NR>1 {count++} END {print count}' $1)" >> resum_alerta.txt

pobresa=$(awk -F';' 'NR>1{
    if ( $3 > max ){
        max = $3
        paisPobre = $1
    }{
        print paisPobre, max
    }
}')
echo "Major Pobresa: $pobresa">> resum_alerta.txt
acces=$(awk -F';' 'NR>1{
    if ( $4 <  min ){
        min = $4
        paisPobre = $1
    }
{
    print paisPobre, min
}
}')
echo "Menor accés a electricitat: $acces" >> resum_alerta.txt
exit 0

