#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Número de parametres incorrecte"
    exit 1
fi


for archivo in $@
do
    longword=""
    longest=0
    contingut=$(grep -o -i '\b[a-z]*\b' $archivo)

    for word in $contingut
    do
        len=${#word}
        if [ $len -gt $longest ];
        then
            longest=$len
            longword=$word
        fi
    done

    echo $archivo $longest $longword
done
exit 0
