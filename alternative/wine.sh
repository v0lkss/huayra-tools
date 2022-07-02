#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#!/bin/bash
root_verify=$(whoami)
usuario=$(users)

function init_program() {
    echo -e "[*] Bienvenido a una Tuwek una herramienta para instalar programas en Linux"
    sleep 0.4
    echo -e "\nQue quieres tipo de archivo quieres instalar??"
    echo -e "[1] .tar.gz     [2] .zip     \n[3] .exe        [4] .deb"; read file_type
    if [ $file_type == "1" ]
    then 
        folder_file
        tar -xf $filename
    elif [ $file_type == "2" ]
    then
        folder_file
        unzip $filename
    elif [ $file_type == "3" ]
    then
        folder_file
        wine $filename
    elif [ $file_type == "4" ]
    then 
        folder_file
        sudo dpkg -i $filename
    else
        echo -e "[-] Err: Opcion no existe..."
    fi

}
    
#Funciones internas del programa
function folder_file() {
    echo -e "\nSelecciona la carpeta en la que está el archivo."
    echo -e "[1] Escritorio    [2] Descargas\n[3] Documentos    [4] Carpeta Personal"; read file_folder
    if [ $file_folder == "1" ]
    then 
        cd /home/$usuario/Escritorio
    elif [ $file_folder == "2" ]
    then
        cd /home/$usuario/Descargas
    elif [ $file_folder == "3" ]
    then
        cd /home/$usuario/Documentos
    elif [ $file_folder == "4" ]
    then
        cd /home/$usuario/
    else
        echo -e "[-] Err: Opcion no existe..."
    fi
    echo -e "Escribe el nombre del archivo..."
    echo -e "Ej: nombre_de_archivo.exe" ; read filename
}

function install_programs() {
    sudo apt-get install wine wine32
    sudo winecfg
    clear
}
if [ $root_verify != "root" ]
then
    echo -e "[-] Es necesario ejecutar el instalador como super-usuario (root)"
    echo -e "sudo ./wine.sh"
else
    install_programs
    init_program
fi


