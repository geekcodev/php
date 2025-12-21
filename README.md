# PHP Docker Образы

Кастомные PHP FPM образы на основе Alpine Linux с предустановленными расширениями.

## 🏷️ Доступные теги

- `ghcr.io/geekcodev/php:latest` - Последняя версия PHP (на данный момент 8.4)
- `ghcr.io/geekcodev/php:8.4` - PHP 8.4

## 🚀 Использование

### В Dockerfile

```dockerfile
FROM ghcr.io/geekcodev/php:8.4

COPY . /var/www/html

# Ваши дополнительные настройки
```

### В Docker Compose

```yaml
version: '3.8'

services:
  app:
    image: ghcr.io/geekcodev/php:8.4
    volumes:
      - ./:/var/www/html
    ports:
      - "9000:9000"
```

### Локальный запуск

```bash
docker pull ghcr.io/geekcodev/php:8.4
docker run -d -p 9000:9000 -v $(pwd):/var/www/html ghcr.io/geekcodev/php:8.4
```

## 📦 Включенные расширения

### PECL расширения
- **Redis** - для работы с Redis
- **Igbinary** - бинарный сериализатор
- **Imagick** - обработка изображений через ImageMagick
- **Mcrypt** - криптографические функции

### Базы данных
- **pgsql** / **pdo_pgsql** - PostgreSQL
- **mysqli** / **pdo_mysql** - MySQL/MariaDB

### Обработка изображений
- **GD** - с поддержкой FreeType, JPEG, WebP

### Математика и форматы
- **BCMath** - математика произвольной точности
- **ZIP** - работа с архивами
- **EXIF** - метаданные изображений
- **Intl** - интернационализация

### XML и SOAP
- **XSL** - XSLT трансформации
- **SOAP** - веб-сервисы
- **XML** - обработка XML

### Системные
- **Sockets** - низкоуровневая работа с сокетами
- **Shmop** / **Sysvsem** / **Sysvmsg** / **Sysvshm** - IPC (межпроцессное взаимодействие)
- **Gettext** - локализация

## 🛠️ Установленные инструменты

- **Composer** (последняя версия)
- **MySQL Client**
- **PostgreSQL Client**
- **Git**
- **Curl / Wget**
- **Unzip**

## 🏗️ Структура веток

Репозиторий использует ветки для управления версиями PHP:

- `main` → собирает тег `:latest`
- `8.4` → собирает тег `:8.4`

При пуше в любую из этих веток автоматически запускается GitHub Actions и публикует соответствующий образ в GitHub Container Registry.

## 📋 Требования

- Docker 20.10+
- Docker Compose 2.0+ (опционально)

## 🐛 Отчеты об ошибках

Если вы обнаружили проблему или хотите предложить улучшение, создайте [Issue](https://github.com/geekcodev/php/issues) в репозитории.

## 📄 Лицензия

MIT License
