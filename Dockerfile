# Use the official PHP image as the base image
FROM php:latest

# Set the working directory inside the container
WORKDIR /var/www/html

# Install system dependencies and PHP extensions
RUN apt-get update && \
    apt-get install -y git zip unzip && \
    docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the application files to the container
COPY . .

# Install PHP dependencies using Composer
RUN composer install

# Expose the port on which your PHP application will run (if applicable)
EXPOSE 80

# Start the PHP development server (you can use your web server here if needed)
CMD ["php", "-S", "0.0.0.0:80"]
