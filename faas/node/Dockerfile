FROM node:10.12.0-alpine

RUN apk --no-cache add curl ca-certificates \
    && echo "Pulling watchdog binary from Github." \
    && curl -sSLf https://github.com/openfaas-incubator/of-watchdog/releases/download/0.5.0/of-watchdog > /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog \
    && apk del curl

WORKDIR /root/

# Turn down the verbosity to default level.
ENV NPM_CONFIG_LOGLEVEL warn

RUN mkdir -p /app

# Wrapper/boot-strapper
WORKDIR /app
COPY package.json ./

# This ordering means the npm installation is cached for the outer function handler.
RUN npm i

COPY index.js ./

# COPY function node packages and install, adding this as a separate
# entry allows caching of npm install
WORKDIR /app/function
COPY function/*.json ./
RUN npm i || :

# COPY function files and folders
COPY function/ ./

WORKDIR /app

ENV cgi_headers="true"
ENV fprocess="./node_modules/.bin/nodemon -q"
ENV mode="http"
ENV upstream_url="http://127.0.0.1:3000"

ENV exec_timeout="10s"
ENV write_timeout="15s"
ENV read_timeout="15s"

HEALTHCHECK --interval=3s CMD [ -e /tmp/.lock ] || exit 1

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]

CMD ["fwatchdog"]
