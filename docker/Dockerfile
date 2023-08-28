# Base image
FROM php:8.1-fpm

# Define as variáveis de ambiente
# ENV DB_DATABASE=laravel
# ENV DB_USERNAME=laraveluser
# ENV DB_PASSWORD=secret

# Set non-root user
# ARG USER_ID=1000
# ARG GROUP_ID=1000
# RUN groupadd -g ${GROUP_ID} appuser && \
#   useradd -l -u ${USER_ID} -g appuser appuser && \
#   install -d -m 0755 -o appuser -g appuser /home/appuser

# Install required system packages and dependencies
RUN apt-get update && apt-get install -y \
  acl \
  unzip \
  nano \
  ca-certificates \
  build-essential \
  libzip-dev \
  libpng-dev \
  libjpeg-dev \
  libfreetype6-dev \
  libonig-dev \
  libxml2-dev \
  libpq-dev \
  curl \
  git \
  tar

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# ISNTALL sqlite3
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev

# Instalar extensões do PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-install pdo pdo_mysql pdo_pgsql pdo_sqlite \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install zip \
  && docker-php-ext-install exif \
  && docker-php-ext-install pcntl \
  && docker-php-ext-install bcmath \
  && docker-php-ext-install calendar \
  && docker-php-ext-install mbstring \
  && docker-php-ext-install soap \
  && docker-php-ext-install intl


# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=2.5.8 \
  && rm composer-setup.php


# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# Copiar o projeto Laravel do diretório 'project' local para o diretório '/var/www' no container
COPY ../project/laravel /var/www/

# Esperar 5 segundos
# RUN sleep 5

# Definir o diretório de trabalho
WORKDIR /var/www/laravel

# List the files and directories in the '/var/www/laravel' directory inside the container
# RUN ls -la /var/www/laravel

# user root
USER root

COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh


# Change ownership of project files to non-root user
#RUN chown -R appuser:appuser /var/www


# Switch to non-root user
#USER appuser

# Expose the port
EXPOSE 8080

# Iniciar o PHP-FPM
CMD ["php-fpm"]

# Add the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]