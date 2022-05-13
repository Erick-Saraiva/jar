#!/bin/bash
#Script instalar java, gui etc!
# Atualizando os pacotes do sistema operacional:
sudo apt update && sudo apt upgrade –y
sudo apt install zip -y
curl -s "https://get.sdkman.io" | bash
source "/home/ubuntu/.sdkman/bin/sdkman-init.sh"
sdk install java
sudo apt install rdesktop
ENTER
