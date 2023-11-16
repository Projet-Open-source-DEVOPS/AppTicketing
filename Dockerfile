FROM php:8.2.4-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy HESK files into the container
COPY ./hesk /var/www/html

# Enable Apache rewrite module
RUN a2enmod rewrite

# Update and install dependencies
RUN apt-get update \
    && apt-get install -y \
        libc-client-dev \
        libkrb5-dev \
        --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure and install PHP extensions
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
    docker-php-ext-install mysqli imap

# Expose port 80
EXPOSE 80

# Remove default Apache index.html
RUN rm -f /var/www/html/index.html

# Configure Apache to use index.php
RUN sed -i 's/DirectoryIndex index.html/DirectoryIndex index.php/g' /etc/apache2/mods-available/dir.conf

CMD ["apache2-foreground"]
