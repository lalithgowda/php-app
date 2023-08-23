# Useing PHP 8.0 image as the base image
FROM php:8.0-apache
# Set the working directory in the container
WORKDIR /var/www/html
# Copying PHP project files to the container
COPY . /var/www/html
# Install PHP dependencies (if needed)

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libpq-dev \
    && docker-php-ext-install pdo_mysql
# Configure Apache
RUN a2enmod rewrite
# Expose port 80 for web host
EXPOSE 80
# Start Apache server
CMD ["apache2-foreground"]

