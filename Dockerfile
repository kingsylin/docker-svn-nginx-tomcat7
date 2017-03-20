FROM java:openjdk-7-jre-alpine
MAINTAINER kingsy <kingsylin@vip.qq.com>

ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.76

RUN apk update && apk add wget bash subversion unzip

RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.zip >/dev/null 2>&1

RUN wget http://apache.mesi.com.ar/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip  >/dev/null 2>&1

COPY ./docker-entrypoint.sh /

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
