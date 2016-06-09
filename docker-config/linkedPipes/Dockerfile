FROM gliderlabs/alpine:3.3

RUN apk update
RUN apk add --update openjdk8 git nodejs wget tar
ENV JAVA_HOME /usr/lib/jvm/default-jvm

RUN git clone https://github.com/linkedpipes/etl.git

# Install Maven:
ENV MAVEN_VERSION="3.3.9"
ENV M2_HOME=/usr/lib/mvn
RUN wget http://apache.mirror.digionline.de/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
RUN tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    mv apache-maven-$MAVEN_VERSION /usr/lib/mvn
ENV PATH $PATH:$M2_HOME/bin

RUN cd etl && mvn install



#RUN apk --update add curl ca-certificates tar

#RUN mkdir /opt && curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
#  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
#    | tar -xzf - -C /opt &&\
#    ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk