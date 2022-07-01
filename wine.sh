#!/bin/bash
root_verify=$(whoami)
usuario=$(users)

function init_program() {
    echo -e "[*] Bienvenido al instalador de Wine(complemento para ejecutar archivos de windows)..."
    sleep 1.5
    sudo apt-get install wine
    sudo apt-get install wine32    
    sleep 1
    sudo winecfg
   
}

if [ $root_verify != "root" ]
then
    echo -e "[-] Es necesario ejecutar el instalador como super-usuario (root)"
    echo -e "sudo ./wine.sh"
else 
    init_program
fi


echo -e "[*] Reinicie el equipo para aplicar los cambios"
