FROM php:8.1.25-apache AS base

# install base dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      git \
      unzip \
      libcurl4-openssl-dev \
      openssh-client \
    && docker-php-ext-install curl pdo pdo_mysql mysqli \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

WORKDIR /var/www/html

# configure ssh for git cloning
RUN mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh \
    && ssh-keyscan github.com >> /root/.ssh/known_hosts

COPY id_rsa.pub /root/.ssh/id_rsa.pub
COPY id_rsa /root/.ssh/id_rsa

RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && chmod 600 /root/.ssh/authorized_keys

#copy untracked .env file for s3
COPY ./../.env /var/www/html

# copy apache-listen.conf
COPY apache-listen.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod ssl && a2ensite 000-default.conf
FROM base AS builder

#mount ssh agent and clone code
RUN --mount=type=ssh git clone git@github.com:guideposts98/SWE6733-Group-1.git /tmp/app

# copy app files from builder
FROM base
COPY --from=builder /tmp/app/ /var/www/html/


# install needed package from composer.json file
RUN cd Packages && composer install --no-dev --optimize-autoloader


RUN chown -R www-data:www-data /var/www/html

# will be done in compose file
EXPOSE 8080

CMD [ "apache2-foreground" ]
