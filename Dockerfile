# Use the official PHP image as the base image
FROM php:latest

# Set the working directory in the container
WORKDIR /var/www/html

# Copy your PHP application files to the container's working directory
COPY . /var/www/html

# Install any PHP extensions or dependencies required by your application
# For example, if you need to install the PDO extension, uncomment the line below
# RUN docker-php-ext-install pdo pdo_mysql

# Expose the container's port to the host machine
EXPOSE 80

# Start the PHP built-in web server
CMD ["php", "-S", "0.0.0.0:80"]
