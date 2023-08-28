#!/bin/bash

echo "entrar no projeto para o composer install e instalar  o jetstream"
cd /var/www/laravel

echo "pegando os componentes laravel basicos com composer"
composer install --no-interaction --no-dev --prefer-dist

echo "criando a chave"
php artisan key:generate

# echo "verificando os dados de acesso ao banco no .env"
# if grep -Fxq "DB_PASSWORD=secret" .env
# then
#     echo "Os dados já estão corretos. Nenhuma alteração necessária."
# else
#     sed -i 's/DB_DATABASE=.*/DB_DATABASE=laravel/g' .env
#     sed -i 's/DB_USERNAME=root/DB_USERNAME=laraveluser/g' .env
#     #sed -i 's/DB_PASSWORD=/DB_PASSWORD=secret/g' .env
#     echo "O valor de DB_DATABASE foi atualizado com sucesso."
# fi

echo "Installing Jetstream..."
composer require laravel/jetstream

echo "Creating Jetstream structure with Livewire..."
php artisan jetstream:install livewire 

echo "rodando o pacote package.json" 
npm install
npm run build

# Run Laravel migrations
php artisan migrate
echo "migrate foi feito com sucesso"
# Execute CMD
exec "$@"
