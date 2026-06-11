FROM node:18-alpine

RUN apk add --no-cache jq git

RUN npm install -g https://github.com/akon01/lgtv2mqtt

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/bin/sh", "/run.sh"]
