FROM dockerfile/java:oracle-java8
MAINTAINER Paul Kling <pkling@gmail.com>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.11
ENV CATALINA_HOME /tomcat
WORKDIR /

# INSTALL TOMCAT
RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* tomcat

RUN mkdir /tomcat/deploy && \
	mkdir /tomcat/deploy/dev && \ 
	mkdir /tomcat/deploy/qa && \
	mkdir /tomcat/deploy/prod

ADD cp_enviroment_settings.sh /cp_enviroment_settings.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV ENVIROMENT dev

EXPOSE 8080
CMD ["/run.sh"]
