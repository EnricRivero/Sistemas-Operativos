#!/bin/bash

#Comprovacions
if [ $# -ne 3 ]; then
	echo "Uso: ./ejercicio2.sh <csv> <year> <umbral>"
	exit 1
fi

CSV=$1
YEAR=$2
UMBRAL=$3


if [ ! -f "$CSV" ]; then
	echo "Error: El fichero '$CSV' no existe."
	exit 1
fi

#Creació del fitxer
OUTPUT="filtrado_${YEAR}.csv"

#Escribim la capcelera
head -n 1 "$CSV"  > "$OUTPUT"

#Filtrar i escriure en el fitxer
awk -F',' -v yr="$YEAR" -v umb="$UMBRAL" ' yr == $3 && $4 >= umb {print$0}' "$CSV" >> "$OUTPUT"

#Contem lineas, amb el tail +2 contem desde la seguna fila fins el final
FILAS=$(tail -n +2 "$OUTPUT"|wc -l)
echo "Filas (sin cabecera) en $OUTPUT: $FILAS"

exit 0


