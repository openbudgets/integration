FROM node:7-alpine

RUN apk add --update git
RUN update-ca-certificates
RUN git clone https://github.com/Rob--W/cors-anywhere.git app
RUN cd /app && npm install


COPY ./startup.sh /startup.sh

EXPOSE 8080

RUN chmod a+x /startup.sh

CMD /startup.sh

