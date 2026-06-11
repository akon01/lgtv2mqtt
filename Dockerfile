FROM node:18-alpine

RUN apk add --no-cache jq

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

RUN chmod +x run.sh

CMD ["/bin/sh", "/app/run.sh"]
