FROM python:3.5
RUN mkdir -p  /usr/src/app
ENV APP_DIR "/usr/src/app"
RUN git clone https://github.com/openbudgets/outlier-dm-ionic2.git $APP_DIR && \
    cd $APP_DIR && \
    git checkout fhg && \
    git checkout ad438128ed6bd4f524d6ebb0c374d15ee280d703
RUN cd $APP_DIR/backend && pip install -r requirements.txt
COPY ./start.sh $APP_DIR/backend/start.sh
CMD ["/bin/sh", "/usr/src/app/backend/start.sh"]
EXPOSE 5000
