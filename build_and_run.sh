#!/bin/bash

echo "Iniciando a estrutura de pastas do projeto"
mkdir docker nginx project

echo "criando os arquivos base do docker"
touch docker-compose.yml
touch Readme.MD
touch .gitignore
touch .env 
touch docker/Dockerfile;
touch nginx/nginx.conf;
touch entrypoint.sh

echo -e "## Arquivo oulto pro projeto\n.env" > .gitignore
echo "## CRIANDO PROJETO LARAVEL DENTRO DO DOCKER" > README.md
echo -e "MYSQL_DATABASE=laravel\n
MYSQL_USER=laraveluser\n
MYSQL_PASSWORD=secret\n
MYSQL_ROOT_PASSWORD=rootpassword" >> .env

echo "Process completed!"
