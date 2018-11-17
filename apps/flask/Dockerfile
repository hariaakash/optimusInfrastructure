FROM python:3.7.0-alpine3.8

WORKDIR /app

RUN apk update && \
    apk upgrade

RUN apk --no-cache add gcc

RUN rm -f /var/cache/apk/*

COPY ./entrypoint.sh /entrypoint.sh

COPY src .

EXPOSE 8080

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]

CMD ["python", "app.py"]
