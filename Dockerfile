FROM debian:latest
RUN apt-get update && \
    apt-get install -y \
    apache2 \
    php7.3
RUN apt-get install -y vim locales wget &&\
rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/America/Santiago /etc/localtime && \
    echo "America/Santiago" > /etc/timezone && \
    echo "LC_ALL=es_CL.UTF-8" >> /etc/environment && \
    echo "es_CL.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "LANG=es_CL.UTF-8" > /etc/locale.conf && \
    locale-gen es_CL.UTF-8 && \
    dpkg-reconfigure -f noninteractive tzdata
RUN wget -O /usr/local/bin/composer https://getcomposer.org/download/latest-stable/composer.phar && \
    chmod +x /usr/local/bin/composer && \
    apt-get clean
 
COPY php.ini /etc/php/7.3/apache2


COPY ./src /var/www/html

EXPOSE 80
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D","FOREGROUND"]
RUN rm /var/www/html/index.html
