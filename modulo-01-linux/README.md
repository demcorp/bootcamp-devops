### Ejercicio 1

* Se ejecutan los siguientes comandos, obteniendo la estructura indicada:

```
mkdir -p foo/dummy foo/empty
echo "Me encanta la bash\!\!" > foo/dummy/file1.txt
touch foo/dummy/file2.txt


└── foo
    ├── dummy
    │   ├── file1.txt
    │   └── file2.txt
    └── empty
```

### Ejercicio 2

* Se ejecutan los siguientes comandos, quedando la estructura:

```
cat foo/dummy/file1.txt > foo/dummy/file2.txt
mv foo/dummy/file2.txt foo/empty


└── foo
    ├── dummy
    │   └── file1.txt
    └── empty
        └── file2.txt
```
    
### Ejercicios 3, 4 y 5

Se han creado los scripts *.sh* que cumplen con los parámeteros requeridos.