# Usar a imagem base do PHP 8.3 com Apache
FROM php:8.3-apache

# Definir diretório de trabalho
WORKDIR /var/www/html

# Instalar dependências básicas
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    libzip-dev \
    curl \
    git \
    zip \
    unzip

# Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instalar Node.js e npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Instalar Yarn
RUN curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Instalar dependências para intl e exif
RUN apt-get install -y \
    libicu-dev \
    libexif-dev

# Instalar extensões PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql zip

# Configurar e instalar GD
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install gd

# Instalar extensões intl e exif
RUN docker-php-ext-install intl exif

# Instalar Xdebug via PECL
RUN pecl install xdebug && docker-php-ext-enable xdebug
