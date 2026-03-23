#!/bin/bash

# Comprobamos que el número de argumentos sea el correcto
if [ $# -ne 2 ]; then
	echo "ERROR: Formato correcto ./ejercicio6.sh <directorio> <termino>"
	exit 1
fi

# Definimos las variables
directorio=$1
termino=$2

# Comprobamos que sea directorio
if [ ! -d $directorio ]; then
       echo "ERROR: El directorio no existe"
       exit 1
fi

# RESUMEN DEL PIPE
# Proceso 1: Recorre el directorio contando el numero de apariciones por ficheros y lo imprime
# Proceso 2: Ordena la lista en orden descendiente
# Proceso 3: Eliminamos el directorio del resultado

resultado=$(for fichero in $(grep -rli "$termino" "$directorio"); do
	count=$(grep -oi "$termino" "$fichero" | wc -l)
    	echo "$count | $fichero"
	done | sort -rn | sed "s|$directorio/||g")

# Si la variable $resultado esta vacia, no se han encontrado ocurrencias
if [ -z "$resultado" ]; then
    echo "ERROR: No se encuentran ocurrencias"
    exit 1
else
    echo "$resultado"
    exit 0
fi

