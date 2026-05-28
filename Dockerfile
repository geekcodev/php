FROM dunglas/frankenphp:1.11.2-php8.4-bookworm

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libicu-dev \
    libzip-dev \
    libxml2-dev \
    libxslt1-dev \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libfreetype6-dev \
    libmagickwand-dev \
    libonig-dev \
    default-mysql-client \
    postgresql-client \
    git \
    unzip \
    curl \
    nodejs \
    npm \
    && pecl install redis igbinary imagick mcrypt \
    && docker-php-ext-enable redis igbinary imagick mcrypt \
    && docker-php-ext-install pcntl pgsql mysqli pdo_pgsql pdo_mysql bcmath exif intl gettext zip xsl soap sockets shmop sysvsem sysvmsg sysvshm \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
