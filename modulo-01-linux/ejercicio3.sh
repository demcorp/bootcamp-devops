#!/bin/bash

# Comprobar el primer parametro
texto="Que me gusta la bash!!!!"
if [ ! -z "$1" ]; then
  texto="$1"
fi

# Comandos ejercicio 1
mkdir -p foo/dummy foo/empty
echo "$texto" > foo/dummy/file1.txt
touch foo/dummy/file2.txt

# Comandos ejercicio 2
cat  foo/dummy/file1.txt > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty

# Mostrar directorios
tree foo
