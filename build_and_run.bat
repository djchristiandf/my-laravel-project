@echo off
echo Cloning the Laravel repository...
git clone https://github.com/laravel/laravel.git project/docker-laravel

cd project/docker-laravel

echo Installing Jetstream...
composer require laravel/jetstream --no-interaction

echo Creating Jetstream structure with Tailwind CSS...
php artisan jetstream:install tailwindcss --teams --no-interaction

cd ../..

echo Building the Docker container with docker-compose...
docker-compose build

echo Starting services with docker-compose...
docker-compose up -d

echo Process completed!