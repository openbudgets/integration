FROM gliderlabs/alpine:3.3

RUN apk add --update python git nodejs
RUN apk add --update --virtual=build-dependencies ca-certificates build-base
RUN update-ca-certificates

RUN git clone http://github.com/openspending/os-viewer.git app
RUN npm install npm -g
RUN npm --version

WORKDIR /app
EXPOSE 8000

RUN npm install && npm run build && npm test
CMD ["npm", "start"]