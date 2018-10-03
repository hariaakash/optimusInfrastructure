FROM nginx:1.15.3-alpine

WORKDIR /app

RUN apk update && \
    apk upgrade && \
    apk --no-cache add wget unzip ca-certificates

COPY ./entrypoint.sh /entrypoint.sh

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY src .

EXPOSE 8080

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]