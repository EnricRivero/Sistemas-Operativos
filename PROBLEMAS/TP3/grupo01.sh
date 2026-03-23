#!/bin/bash

if [ $# -ne 3 ];
then
    echo "Format incorrecte, el format correcte és: ./GrupA01.sh <directori_logs> <nom_app> <codi_de_resposta_http>";
    exit 1
fi

#Extraiem els elements d'entrada per fer el codi més entenedor
logs=$1
app=$2
codi=$3

#S'obtè tots els fitxers log:
fitxers=$( find "$logs/$app/" -name "*.log" )

#Es filtren les linies que contenen el codi al log:

#grep "$codi" $fitxers

#S'ha decidit fer-ho per mitjà d'awk, doncs el grep pot comportar coincidències amb la ip, en canvi amb awk podem determinar la columna a estudiar.
awk -v x=$codi '{
    if ( $3 == x ){
        print $0
    }
}' $fitxers

#S'obtenen tots els fitxers rotated:
fitxers=$( find "$logs/$app/" -name "*.log.*" )

#Es filtren les linies que tenen el codi al rotated:

#grep "$codi" $fitxers

awk -v x=$codi '{
    if( $3 == x ) {
        print $0
    }
}' $fitxers




exit 0
