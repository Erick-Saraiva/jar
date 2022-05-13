#!/bin/bash
#Script rodar jar!
# Clonando o repositorio do jar
mkdir testeJar
cd testeJar
git clone https://github.com/Erick-Saraiva/jar.git
cd jar
# Rodando o nosso arquivo jar que foi disponibilizado na pasta:
rdesktop -u ubuntu -g 90% -PKD 50.17.72.187
java –jar LoginHealthInspec-1.0-SNAPSHOT-jar-with-dependencies.jar
