FROM php:8.2-cli

# Install mysqli extension (required for database connection)
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

WORKDIR /app
COPY . .

CMD ["php", "-S", "0.0.0.0:10000"]
