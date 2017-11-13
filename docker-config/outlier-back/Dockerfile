FROM python:3.5
RUN mkdir -p  /usr/src/app
ENV APP_DIR "/usr/src/app"
RUN git clone https://github.com/openbudgets/outlier-dm-ionic2.git $APP_DIR && \
    cd $APP_DIR && \
    git checkout bc73b8f9af95a30d7ae90125c87ce2b99485472f
RUN cd $APP_DIR/backend && pip install -r requirements.txt
CMD ["python3", "/usr/src/app/backend/app.py"]
EXPOSE 5000
