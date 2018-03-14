FROM openjdk:8u151-jdk-alpine3.7

LABEL maintainer="Michael Chi <chicong@outlook.com>"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir /data
RUN mkdir /data/app

ENV APP_NAME=hall-user
ENV APP_VERSION=0.0.1-SNAPSHOT
ENV APP_PORT=30301

#COPY build/libs/${APP_NAME}-${APP_VERSION}.jar /data/app

EXPOSE ${APP_PORT}

#CMD ["sh","-c","java -jar /data/app/${APP_NAME}-${APP_VERSION}.jar > /var/log/${APP_NAME}.log 2>&1"]
CMD ["sh","-c","java -jar /data/app/${APP_NAME}-${APP_VERSION}.jar"]
