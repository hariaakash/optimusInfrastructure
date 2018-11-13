FROM python:3.7.0-alpine3.8

WORKDIR /app

RUN apk update && \
    apk upgrade && \
    apk --no-cache add gcc

COPY ./entrypoint.sh /entrypoint.sh

COPY src .

EXPOSE 8080

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]

CMD ["export", "FLASK_APP=app.py"]

CMD ["flask", "run"]
