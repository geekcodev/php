FROM php:8.4.12-fpm-bookworm

RUN apt-get update && apt-get install -y \
    make \
    automake \
    autoconf \
    g++ \
    gcc \
    git \
    curl \
    wget \
    unzip \
    passwd \
    openssl \
    libssl-dev \
    default-mysql-client \
    postgresql-client \
    libmcrypt-dev \
    gettext \
    libicu-dev \
    zlib1g \
    zlib1g-dev \
    libzip-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libfreetype6-dev \
    libmagickwand-dev \
    libonig-dev \
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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ARG INSTALL_XDEBUG=false

RUN if [ "${INSTALL_XDEBUG}" = "true" ]; then \
      pecl install xdebug-3.4.7 && docker-php-ext-enable xdebug; \
    fi
