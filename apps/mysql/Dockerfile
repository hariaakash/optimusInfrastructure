FROM alpine:3.8

WORKDIR /app

RUN apk update && \
    apk upgrade

RUN apk --no-cache add mysql mysql-client

RUN rm -f /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]
