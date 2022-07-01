#!/bin/bash
root_verify=$(whoami)
usuario=$(users)

function init_program() {
    echo -e "[*] Bienvenido al instalador de CS 1.6..."
    sleep 1.5
    sudo apt-get install wine
    sleep 1
    winecfg
    xdg-open "https://www.mediafire.com/file/a9cnfjjhfjy6wbr/Cs_1.6_Full_Espa%25C3%25B1ol_LMT.rar/file"
}

if [ $root_verify != "root" ]
then
    echo -e "[-] Es necesario ejecutar el instalador como super-usuario (root)"
    echo -e "sudo ./wine.sh"
else 
    init_program
fi
