#!/bin/bash
echo "Olá irei lhe ajudar com a instalação de programas necessários para nosso aplicativo"
echo "Procurando o Zip Instalador zip"
which zip
if [ $? = 0 ]
then echo "Você já possui zip instalado""
else echo "Você não possui o zip irei iniciar a instalação dele:"
sudo apt install zip -y

echo "Adicionando o caminho sdk ao curl"
curl -s "https://get.sdkman.io" | bash
fi
echo "irei reiniciar o terminal agora:"
source "/home/$usuario/.sdkman/bin/sdkman-init.sh"


echo "Verificando se você já possui o Java:"
which java
if [ $? = 0 ]
then echo "Você já possui o java instalado"
else echo "Você não possui o java, instalando java"
sudo sdk install java 11.0.11-open
fi
echo "Versão do java instalada: "
java -version

echo "Irei atualizar os pacotes agora:"
sudo apt update && sudo apt upgrade -y


echo "Verificando se você já possui o Docker:"
which docker
if [ $? = 0 ]
then echo "Você já possui o docker instalado."
else echo "Você não possui o docker instalado, irei instalar ele agora:"
sudo apt install docker.io -y
fi
echo "Iniciando o docker:"
sudo systemctl start docker
sudo systemctl enable docker


echo "Verificando se você já possui o maven:"
which maven
if [ $? = 0 ]
then echo "Você já possui o maven instalado."
else echo "Você não possui o maven instalado, irei instalar agora mesmo."
sudo apt install maven -y
fi


echo "Clonando nosso repositório do git"
git clone https://github.com/Erick-Saraiva/jarCli.git

echo "Entrando nesse repositório e atualizando o Jar"
cd jarCli/cli
git pull

echo "Atualizando o jar"
mvn clean package

echo "Configurando o Container e a nossa aplicação"
sudo docker build -t ericksaraiva/healthcli .

# Iniciando aplicação
sudo docker run ericksaraiva/healthcli