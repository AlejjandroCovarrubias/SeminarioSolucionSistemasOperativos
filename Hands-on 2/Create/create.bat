@echo off
echo Creando archivo mytext...
if not exist mytext.txt echo Hola Mundo > mytext.txt
echo ### Leyendo archivo mytext... ###
type mytext.txt
echo.
echo.
echo Creando carpeta backup...
if not exist backup mkdir backup
echo ### Contenido de carpeta backup ###
dir backup\
echo.
echo.
echo Moviendo archivo mytext a backup...
if not exist backup\mytext.txt copy mytext.txt backup\
echo ### Contenido de carpeta backup ###
dir backup\
echo.
echo.
echo Eliminando carpeta backup y archivo mytext...
del backup\mytext.txt
rmdir backup
echo ### Contenido de la carpeta actual ###
echo.
echo.
dir
pause