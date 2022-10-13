FROM  ampache/ampache:latest
LABEL maintainer="aguinaldoabbj"

# Installing addition dependencies
RUN apt-get update && apt-get install -y \
  openssl \
  && rm -rf /var/lib/apt/lists/*

# Copying add-on scripts
COPY add-on-files/scripts/*.sh /usr/local/bin/
COPY add-on-files/conf/*.conf /etc/apache2/sites-available/
RUN chmod +x /usr/local/bin/*.sh

# Enable SSL Apache
RUN a2ensite ampache-ssl && a2enmod ssl

EXPOSE 80 443