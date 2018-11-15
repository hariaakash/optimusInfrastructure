FROM nginx:1.15.3-alpine

WORKDIR /app

RUN apk update && \
    apk upgrade

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY src .

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]