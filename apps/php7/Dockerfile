FROM nginx:1.15.3-alpine

WORKDIR /app

RUN apk update && \
    apk upgrade

RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype \
    php7-mbstring php7-gd php7-session php7-pdo php7-pdo_mysql supervisor curl

RUN rm -f /var/cache/apk/*

COPY config/nginx.conf /etc/nginx/conf.d/default.conf

COPY config/fpm-pool.conf /etc/php7/php-fpm.d/zzz_custom.conf
COPY config/php.ini /etc/php7/conf.d/zzz_custom.ini

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY src .

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]