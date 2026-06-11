FROM node:18-alpine

RUN apk add --no-cache jq

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY index.js config.js ./

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/bin/sh", "/run.sh"]
