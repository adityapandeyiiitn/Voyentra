FROM php:8.2-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Set the working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Set permissions for Apache
RUN chown -R www-data:www-data /var/www/html

# Render uses port 10000 by default for some plans, but Apache uses 80.
# We can change Apache's port to 10000 to match your request.
RUN sed -i 's/80/10000/g' /etc/apache2/sites-available/0000-default.conf /etc/apache2/ports.conf

# Expose the port
EXPOSE 10000

# Start Apache
CMD ["apache2-foreground"]
