#!/bin/bash

echo "## Creando archivo de mytext ##"
echo "Hola Mundo" > mytext.txt
echo "## Listando contenido de mytext ##"
cat mytext.txt
echo "## Creando carpeta backup ##"
mkdir -p backup
echo "## Listando contenido ##"
ls -l
echo "## Moviendo el archivo mytext a backup ##"
mv mytext.txt backup/
echo "## Listar contenido en backup ##"
ls -l backup
echo "## Eliminando archivo de mytext ##"
rm backup/mytext.txt
echo "## Eliminando carpeta Backup ##"
rmdir backup
echo "## Listando contenido ##"
ls -l
