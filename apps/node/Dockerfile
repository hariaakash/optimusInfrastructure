FROM node:10.9.0-alpine

WORKDIR /usr/src/app

COPY src/package*.json ./

RUN npm install

COPY src .

EXPOSE 8080

CMD ["npm", "start"]
