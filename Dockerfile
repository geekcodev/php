FROM php:8.4.12-fpm-alpine3.22

RUN apk update && apk add --no-cache \
    linux-headers \
    make \
    automake \
    autoconf \
    g++ \
    gcc \
    git \
    curl \
    wget \
    unzip \
    shadow \
    musl-utils \
    openssl-dev \
    mysql-client \
    postgresql-client \
    libmcrypt \
    libmcrypt-dev \
    gettext \
    gettext-dev \
    icu \
    icu-dev \
    icu-libs \
    icu-data-full \
    zlib \
    zlib-dev \
    libzip-dev \
    libxml2 \
    libxml2-dev \
    libxslt \
    libxslt-dev \
    libpq-dev \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    libwebp \
    libwebp-dev \
    freetype-dev \
    imagemagick-dev \
    php84 \
    php84-fpm \
    && pecl install mcrypt \
    && docker-php-ext-enable mcrypt \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install igbinary \
    && docker-php-ext-enable igbinary \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install -j$(nproc) pgsql mysqli pdo_pgsql pdo_mysql bcmath exif intl gettext \
    && docker-php-ext-install -j$(nproc) zip xsl soap sockets shmop sysvsem sysvmsg sysvshm pcntl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd \
    && rm -rf /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
