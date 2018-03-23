FROM node:6.11.0
RUN mkdir -p /usr/src/app
ENV APP_DIR "/usr/src/app"
RUN git clone https://github.com/openbudgets/outlier-dm-ionic2.git $APP_DIR  && \
    cd $APP_DIR && \
    git checkout fhg && \
    git checkout ad438128ed6bd4f524d6ebb0c374d15ee280d703
RUN npm install
RUN npm install -g ionic cordova
RUN npm install --save-dev --save-exact @ionic/app-scripts@^1.3.7
RUN npm install --save-dev @ionic/cli-plugin-ionic-angular@latest
RUN npm install --save-dev typescript@>=2.1.0
EXPOSE 8100
EXPOSE 35729
CMD cd $APP_DIR && yes | ionic serve --all
