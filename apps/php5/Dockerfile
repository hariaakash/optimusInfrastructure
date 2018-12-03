FROM nginx:1.15.3-alpine

WORKDIR /app

RUN apk update && \
    apk upgrade

RUN apk --no-cache add php5 php5-fpm php5-mysqli php5-json php5-openssl php5-curl \
    php5-zlib php5-xml php5-phar php5-intl php5-dom php5-xmlreader php5-ctype \
    php5-gd php5-pdo php5-pdo_mysql supervisor curl

RUN rm -f /var/cache/apk/*

COPY config/nginx.conf /etc/nginx/conf.d/default.conf

COPY config/fpm-pool.conf /etc/php5/php-fpm.d/zzz_custom.conf
COPY config/php.ini /etc/php5/conf.d/zzz_custom.ini

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY src .

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]