FROM node:7.1

RUN apt-get -y update
RUN apt-get install -y git npm wget curl

RUN npm install -g angular-cli

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone https://github.com/okgreece/indigo.git /app
WORKDIR /app

#RUN git pull origin master && git checkout 3665b2b4d9ac915587496d7b59f3255eec57da3b

# COPY config files:
COPY ./index.html /app/src/index.html
# COPY ./tsconfig.json /app/tsconfig.json
COPY ./environment.ts /app/src/environments/environment.ts

RUN npm install

RUN echo "ng serve --host 0.0.0.0" > /start.sh
#RUN echo "npm start" > /start.sh
CMD ["/bin/sh", "/start.sh"]