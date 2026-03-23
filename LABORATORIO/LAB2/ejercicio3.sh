#/bin/bash

# Comprovacion argumentos de entrada
if [ $# -ne 3 ]; then
	echo "Formato de uso: ./ejercicio3.sh <csv> <year> <N>"
	exit 1
fi

# Definimos las variables
file=$1
year=$2
n=$3

# Comprovar que el ficher es un .csv
if [[ "$file" != *.csv ]]; then
	echo "El archivo debe ser .csv"
	exit 1
fi

# Filtramos por año y lo añadimos al fichero aux
awk -F',' '$3 == "'$year'"' $file > aux.csv

# Comprovamos que no se nos pidan más líneas de las que tiene el fichero
lineas=$(wc -l < aux.csv)
if [ $n -gt $lineas ]; then
	echo "El número de líneas solicitado es más grande que el número de líneas del fichero $lineas"
	exit 1
fi

# Ordenamos las líneas en orden descendente
sort -t',' -k4 -rn aux.csv -o aux.csv

# Imprimimos las primeras n líneas
head -n $n aux.csv

# Borramos el fichero auxiliar
rm aux
exit 0
