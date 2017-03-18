FROM alpine:latest
MAINTAINER kingsy <kingsylin@vip.qq.com>

RUN apk update && apk add curl bash subversion nginx

COPY ./docker-entrypoint.sh /

COPY nginx_default.conf /etc/nginx/conf.d/default.conf

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]