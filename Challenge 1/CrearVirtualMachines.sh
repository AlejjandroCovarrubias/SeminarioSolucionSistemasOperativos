#!/bin/bash

# Busca si existe el comando
if ! command -v VBoxManage &> /dev/null; then
    echo "VBoxManage no esta instalado..."
    exit 1
fi

echo "Ingrese el nombre de la máquina virtual: "
read VM_Name

echo "Seleccione el tipo de sistema operativo a instalar:"
echo "1) Ubuntu"
echo "2) Debian"
echo "3) Fedora"
echo "4) ArchLinux"
echo "5) RedHat"
echo "6) Linux_64"
read OPTION

case $OPTION in
    1) OS="Ubuntu_64" ;;
    2) OS="Debian_64" ;;
    3) OS="Fedora_64" ;;
    4) OS="ArchLinux_64" ;;
    5) OS="RedHat_64" ;;
    6) OS="Linux_64" ;;
    *) echo "Opción no válida, por defecto se usará Linux_64"; OS="Linux_64" ;;
esac

echo "Ingrese el número de CPUs: "
read CPU

echo "Ingrese el tamaño de la memoria RAM (en formato GB): "
read RAM

echo "Ingrese el tamaño de la memoria VRAM: "
read VRAM

echo "Ingrese el tamaño del disco duro (en GB): "
read DISK

echo "Ingrese el nombre del controlador SATA: "
read SATA

echo "Ingrese el nombre del controlador IDE: "
read IDE

# Cambiar de GB a MB para la ram y VRAM
RAM_SIZE=$((RAM * 1024))

if ((VRAM > 256)); then
    echo "El máximo es 256, por lo tanto eso se asignará..."
    VRAM=256
fi

# Cambiar el tamaño del disco a MB
DISK_SIZE=$((DISK * 1024))

VBoxManage createvm --name "$VM_Name" --ostype "$OS" --register
echo "- - - VM Creada - - -"

VBoxManage modifyvm "$VM_Name" --cpus $CPU --memory $RAM_SIZE --vram $VRAM
echo "- - - VM Modificada: Asignando CPU, RAM y VRAM - - -"

VBoxManage createmedium disk --filename "$HOME/VirtualBox VMs/$VM_Name/$VM_Name.vdi" --size $DISK_SIZE --format VDI
echo "- - - Disco creado - - -"
VBoxManage storagectl "$VM_Name" --name "$SATA" --add sata --controller IntelAhci
echo "- - - SATA Creado - - -"
VBoxManage storageattach "$VM_Name" --storagectl "$SATA" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox VMs/$VM_Name/$VM_Name.vdi"
echo "- - - SATA Añadida a la VM - - -"
VBoxManage storagectl "$VM_Name" --name "$IDE" --add ide
echo "- - - IDE Creada y asignada a la VM - - -"

echo "Configuración final:"
VBoxManage showvminfo "$VM_Name"