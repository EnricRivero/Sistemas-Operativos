#!/bin/bash

if [ $# -ne 5 ];
then
    echo "Format d'entrada incorrecte, hauría de ser: ./ejercicio2.sh <poverty_csv> <services_csv> <YEAR> <POV_MIN> <ELEC_MAX>"
    exit 1
fi

#Inicialització de variables amb la finalitat de llegibilitzar el codi:

poverty_csv=$1
services_csv=$2
YEAR=$3
POV_MIN=$4
ELEC_MAX=$5


#Es crea el fitxer i s'insereix la primera linea:

nomFitxer=$(echo "alerta_ods1_$YEAR.txt")
echo "Code;Entity;PovertyRate;Electricity">$nomFitxer

echo "Generant document $nomFitxer"

#Recorrem els dos fitxer amb un awk, per a obtindre les dades:

awk -F',' -v minPob=$POV_MIN -v maxElec=$ELEC_MAX -v any=$YEAR 'FNR==NR{
    if($4 >= minPob && $3 == any){
        diccionari[$2]=$2";"$1";"$4
    }
next
}
{
    if($4 <= maxElec && $3 == any && $2 in diccionari){
        printf "%s;%s\n",diccionari[$2],$4
    }
}' "$poverty_csv" "$services_csv" >> "$nomFitxer"

paisosDetectats=$(awk 'NR>1 {count++} END {print count}' $nomFitxer)
echo "Paisos detectats: $paisosDetectats"
exit 0


