FROM nginx:1.15.3-alpine

WORKDIR /app

RUN apk update && \
    apk upgrade

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY src .

CMD ["nginx", "-g", "daemon off;"]