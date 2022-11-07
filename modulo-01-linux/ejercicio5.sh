#!/bin/bash

# Comprobar que se han introducido dos parametros
if [ ! $# -eq 2 ]; then
  echo "> Se necesitan únicamente dos parámetros para ejecutar este script"
  exit 1
fi

URLtext=$1
word=$2
URLtmp="/tmp/urlfile"

# Descarga la URL que se indica en /tmp
curl -s -X GET "$URLtext" -o $URLtmp

# Busca el numero de coincidencias
num=$(grep -o $word $URLtmp | wc -l)

if [ $num -eq 0 ]; then
  echo "> No se ha encontrado la palabra \"$word\""
else
  firstline=$(grep -n $word -m1 $URLtmp | awk -F\: '{print $1}')
  # Solo encuentra una coincidencia
  if [ $num -eq 1 ]; then
    echo "> La palabra \"$word\" aparece 1 vez"
    echo "> Aparece únicamente en la línea $firstline"
  # Encuentra varias coincidencias
  else
    echo "> La palabra \"$word\" aparece $num veces"
    echo "> Aparece por primera vez en la línea $firstline"
  fi
fi

# Limpieza
rm $URLtmp