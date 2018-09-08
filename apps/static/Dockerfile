FROM nginx:1.15.3-alpine

WORKDIR /app

COPY src .

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
