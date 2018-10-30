FROM node:10.9.0-alpine

WORKDIR /app

RUN apk update && \
    apk upgrade

COPY ./entrypoint.sh /entrypoint.sh

COPY src .

EXPOSE 8080

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]

CMD ["npm", "start"]
