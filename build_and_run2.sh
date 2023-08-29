#!/bin/bash

echo "Cloning the Laravel repository..."
git clone https://github.com/laravel/laravel.git project/laravel

cd project/laravel
  
echo "Copying .env.example to .env..."
cp .env.example .env
  
echo "alterando o  dados de acesso ao banco no .env"
sed -i 's/DB_HOST=127.0.0.1/DB_HOST=db/g' .env
sed -i 's/DB_DATABASE=laravel/DB_DATABASE=laravel/g' .env
sed -i 's/DB_USERNAME=root/DB_USERNAME=laraveluser/g' .env
sed -i 's/DB_PASSWORD=/DB_PASSWORD=secret/g' .env

#   if grep -Fxq "DB_PASSWORD=secret" .env
#   then
#       echo "Os dados já estão corretos. Nenhuma alteração necessária."
#   else
#       sed -i 's/DB_DATABASE=laravel/DB_DATABASE=laravel/g' .env
#       sed -i 's/DB_USERNAME=root/DB_USERNAME=laraveluser/g' .env
#       # sed -i 's/DB_PASSWORD=/DB_PASSWORD=secret/g' .env
#       echo "O valor de DB_DATABASE foi atualizado com sucesso."
#   fi

echo "voltando a raiz do projeto para achar o docker-compose.yml"
cd ../..

#echo "injetando as variaveis no docker-compose"
#export MYSQL_DATABASE=$(grep MYSQL_DATABASE .env | xargs)
#export MYSQL_USER=$(grep MYSQL_USER .env | xargs)
#export MYSQL_PASSWORD=$(grep MYSQL_PASSWORD .env | xargs)
#export MYSQL_ROOT_PASSWORD=$(grep MYSQL_ROOT_PASSWORD .env | xargs)

echo "Building the Docker container with docker-compose..."
docker compose build

echo "Starting services with docker-compose..."
docker compose up -d --build                                                                                                                                                                                                                                                                                                                                                                  
echo "Process completed!"