FROM alpine

RUN apk update \
&&  apk upgrade \
&&  apk add nginx

COPY ./srcs/nginx/* srcs_docker/

EXPOSE 80 443

ENTRYPOINT ["srcs_docker/docker-entrypoint.sh"]
