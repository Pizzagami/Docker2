FROM alpine
ARG IP

# We install packages
RUN apk update
RUN apk add openrc --no-cache
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# We create a new user
RUN { echo "password"; echo "password"; } | adduser user

#RUN echo 172.17.0.2 > ip.txt
RUN echo ${IP} > ip.txt

COPY ./start.sh /start.sh
CMD ["/bin/sh", "/start.sh"] 
EXPOSE 21 21000