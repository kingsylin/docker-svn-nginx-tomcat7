FROM alpine:latest
MAINTAINER kingsy <kingsylin@vip.qq.com>

RUN apk update && apk add curl bash subversion nginx

COPY ./docker-entrypoint.sh /

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]