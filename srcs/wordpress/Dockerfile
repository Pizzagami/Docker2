FROM alpine

RUN apk update	\
&& apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /var/www /utils										\
&&  cd /var/www												\
&&  wget http://fr.wordpress.org/latest-fr_FR.tar.gz							\
&&  tar -zxf latest-fr_FR.tar.gz									\
&&  rm -f latest-fr_FR.tar.gz

COPY ./srcs/wp-config.php /var/www/wordpress
COPY ./srcs/wordpress.sh /utils
COPY ./srcs/status.sh /utils

EXPOSE 5050

CMD ["/bin/sh", "/utils/wordpress.sh"]
