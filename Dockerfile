FROM php:7.1.5-apache

ENV APP_HOME /var/www/html

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN sed -i -e "s/html/html/g" /etc/apache2/sites-enabled/000-default.conf \
    && a2enmod rewrite

COPY . $APP_HOME

RUN chown -R www-data:www-data $APP_HOME

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
