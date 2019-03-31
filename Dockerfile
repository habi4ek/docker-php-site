FROM php:7.3-apache

RUN docker-php-ext-install mysqli

# apache config
COPY apacheConf/apache2.conf /etc/apache2/

# site config
COPY apacheConf/mysite.com.conf /etc/apache2/sites-available/
COPY apacheConf/mysite.com.ssl.conf /etc/apache2/sites-available/

RUN a2enmod expires headers rewrite ssl

# enable site
RUN a2ensite mysite.com.conf
RUN a2ensite mysite.com.ssl.conf

RUN apt-get update \
 && apt-get install -y cron mc \
 && apt-get autoremove -y \
 && rm -r /var/lib/apt/lists/* \
 && rm -rf /tmp/*

# if you need tasks scheduler
COPY cron /etc/cron.d/cron
RUN crontab /etc/cron.d/cron
