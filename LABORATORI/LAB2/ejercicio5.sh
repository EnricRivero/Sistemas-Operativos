#!/bin/bash

#Comprovacions
if [ $# -ne 4 ]; then
    echo "Uso: ./ejercicio5.sh <csv> <year_ini> <year_fin> <N>"
    exit 1
fi

CSV=$1
S_YEAR=$2
E_YEAR=$3
N=$4

#Filtratge i mitjana aritmètica
awk -F',' -v inicio="$S_YEAR" -v fin="$E_YEAR" '
    #Comprovem condició 
    NR > 1 && $3 >= inicio && $3 <= fin {
        suma[$2] += $4
        muestras[$2]++
        nombres[$2] = $1
    }
    #Escrivim el format de la solució amb el format demanat
    END {
        for (i in suma) {
            printf("%.6f | %s | %s | %d\n", suma[i]/muestras[i], i, nombres[i], muestras[i])
        }
    }
#Ordenació limitada pel rànking de N països
' "$CSV" | sort -nr | head -n "$N"

exit 0
