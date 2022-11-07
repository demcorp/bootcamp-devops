#!/bin/bash

# Comprobar que se ha introducido una palabra para buscar
if [ -z "$1" ]; then
  echo "Falta la palabra que se quiere buscar"
  exit 1
fi

URLtext="https://es.lipsum.com/feed/html"
word=$1
URLtmp="/tmp/urlfile"

# Descarga la URL que se indica en /tmp
curl -s -X GET "$URLtext" -o $URLtmp

# Busca el numero de coincidencias
num=$(grep -o $word $URLtmp | wc -l)

if [ $num -eq 0 ]; then
  echo "> No se ha encontrado la palabra \"$word\""
else
  firstline=$(grep -n $word -m1 $URLtmp | awk -F\: '{print $1}')
  echo "> La palabra \"$word\" aparece $num veces"
  echo "> Aparece por primera vez en la línea $firstline"
fi

# Limpieza
rm $URLtmp
