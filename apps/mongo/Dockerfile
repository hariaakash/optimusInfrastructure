FROM alpine:3.8

RUN apk update && \
    apk upgrade

RUN apk --no-cache add mongodb

RUN rm -f /var/cache/apk/*

RUN mkdir -p /data/db

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 27017

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]
