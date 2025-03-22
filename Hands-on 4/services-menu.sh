#!/bin/bash

while true; do
    clear
    echo "- - - - Servicios - - - -"
    echo "1) Listar contenido en un directorio"
    echo "2) Crear un archivo de texto"
    echo "3) Comparar dos archivos de texto"
    echo "4) Sustituir palabras  de un archivo con awk"
    echo "5) Buscar una palabra en un archivo con grep"
    echo "6) Salir"
    echo " - - - - - - - - - - - - -"
    read -p "Su opción: " opcion

    case $opcion in
        1)
            echo ". . . Listar contenido en un directorio . . ."
            read -p "Ingrese la ruta absoluta del directorio: " ruta
            if [ -d "$ruta" ]; then
                echo "Contenido:"
                ls -l "$ruta"
            else
                echo "Error en la ruta absoluta"
            fi
                read -p " . . . Presione enter para continuar . . . "
                clear
            ;;
        2)
            echo ". . . Crear un archivo de texto . . ."
            read -p "Ingrese el nombre del archivo, sin extension: " archivo
            read -p "Ingrese el contenido del archivo a crear: " contenido
            echo "$contenido" > "${archivo}.txt"
            echo "Archivo creado con exito"
            ls -l "${archivo}.txt"
            echo "Leyendo archivo"
            cat "${archivo}.txt"
            read -p " . . . Presione enter para continuar . . . "
                clear
            ;;
        3)
            echo ". . . Comparar dos archivos de texto . . ."
            read -p "Ingrese la ruta del primer archivo: " archivo1
            read -p "Ingrese la ruta del segundo archivo: " archivo2
            if [ -f "$archivo1" ] && [ -f "$archivo2" ]; then
                diff "$archivo1" "$archivo2"
            else
                echo "Error"
            fi
                read -p " . . . Presione enter para continuar . . . "
                clear
            ;;
        4) 
            echo ". . . Sustituir palabras . . ."
            read -p "Ingrese el archivo donde se realizara el reemplazo: " archivo
            read -p "Ingrese la palabra a reemplazar: " palabra_reemplazar
            read -p "Ingrese la palabra que va a sustituir: " sustituto
            if [ -f "$archivo" ]; then 
                echo "Archivo antes de la modificacion:"
                cat "$archivo"
                awk -v old="$palabra_reemplazar" -v new="$sustituto" '{gsub(old,new); print}' "$archivo" > temp.txt && mv temp.txt "$archivo"
                echo "Reemplazo terminardo"
                cat "$archivo"
            else
                echo "Error"
            fi
                read -p " . . . Presione enter para continuar . . . "
                clear
            ;;
        5)
            echo ". . . Buscar una palabra en un archivo . . ."
            read -p "Ingrese el archivo donde se realizara la busqueda: " archivo
            if [ -f "$archivo" ]; then 
                read -p "Ingresa la palabra a buscar: " palabra
                echo "Resultados:"
                grep --color=auto "$palabra" "$archivo"
            else
                echo "Error"
            fi
                read -p " . . . Presione enter para continuar . . . "
                clear
            ;;
        6)
            echo "Saliendo..."
            echo "Programa realizado por Alejandro Jesús García Covarrubias"
            exit 0
            ;;
        *)
            echo "Opción no válida"
            ;;
    esac
done


