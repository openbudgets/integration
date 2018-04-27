FROM node:8-alpine

RUN apk add --update git

RUN git config --global url."https://github.com/".insteadOf git@github.com: && \
    git config --global url."https://".insteadOf git://

RUN git clone http://github.com/openspending/os-viewer.git app && \
    cd /app && git checkout 955e9bc942c3c040ff133d04d8c56ee93aa792f8

COPY ./obeu_specific/header.html /app/app/views/partials/header.html
COPY ./obeu_specific/base.html /app/app/views/layouts/base.html
COPY ./obeu_specific/styles.less /app/app/front/styles/styles.less
COPY ./obeu_specific/footer.html /app/app/views/partials/footer.html
COPY ./obeu_specific/template.html /app/app/front/scripts/directives/package-info/template.html
COPY ./obeu_specific/theme.css /app/app/views/partials/theme.css
COPY ./obeu_specific/embedded.less /app/app/front/styles/embedded.less
COPY ./prod_config/themes/default.json /app/app/config/themes/default.json
COPY ./obeu_specific/module.js /app/app/front/scripts/module.js



ADD settings.json /app/settings.json

RUN cd /app && npm install -g napa && napa eligrey/FileSaver.js:file-saver && napa d3/d3-plugins:d3-plugins
ADD ./translations/el.json /app/translations/el.json
RUN cd /app && npm install && npm run build
COPY ./obeu_specific/openbudgets-logo.ico /app/public/favicon.ico
ADD /settings.json /app/settings.json

EXPOSE 8000
ENV OS_VIEWER_BASE_PATH=viewer/

COPY ./start.sh /start.sh
RUN chmod a+x /start.sh
CMD ["/bin/sh", "/start.sh"]
