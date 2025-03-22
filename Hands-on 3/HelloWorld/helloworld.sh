#!/bin/bash

echo "Hello World"
echo "## Listando Archivos ##"
ls -l
echo "## Creando carpeta Test ##" 
mkdir -p Test
echo "## Listando Archivos ##"
ls -l
echo "## Moviendonos hacía carpeta Test ##" 
cd Test || exit
echo "## Listando Archivos  ##" 
ls -l