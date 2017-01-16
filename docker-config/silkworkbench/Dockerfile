FROM java:openjdk-8

RUN apt-get update -y
RUN apt-get install -y git wget curl

ENV SILK_VERSION="2.7.1"
ENV SILK_APP="silk-workbench-$SILK_VERSION"
RUN wget https://github.com/silk-framework/silk/releases/download/release-2.7.1/$SILK_APP.tgz && \
    tar -xvf $SILK_APP.tgz && \
    rm -f $SILK_APP.tgz

EXPOSE 9000
VOLUME /root/.silk

COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]



