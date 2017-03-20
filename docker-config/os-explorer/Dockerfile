FROM node:7-alpine

RUN apk add --update git
RUN update-ca-certificates
RUN git clone http://github.com/openspending/os-explorer.git app

COPY ./startup.sh /startup.sh

EXPOSE 8000
RUN chmod a+x /startup.sh

CMD /startup.sh
