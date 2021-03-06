FROM alpine
RUN apk update												\
&&  apk upgrade												\
&&  apk add nginx openssl ca-certificates openssh vim sudo openrc					\
&&  mkdir /run/nginx											\
&&  mkdir /utils											\
&&  rc-update add sshd											\
&&  rc boot												\
&&  sed -e 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' -i /etc/sudoers	\
&&  adduser -D user											\
&&  passwd -d  user											\
&&  sed -e 's/^wheel:\(.*\)/wheel:\1,user/g' -i /etc/group

COPY ./srcs/wati /var/www/wati
COPY ./srcs/motd /etc
COPY ./srcs/nginx.sh /utils
COPY ./srcs/sshd_config /etc/ssh/.
COPY ./srcs/default.conf /etc/nginx/conf.d
COPY ./srcs/interfaces /etc/network
COPY ./srcs/status.sh /utils

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
    -subj '/C=FR/ST=75/L=Paris/O=42/CN=avan-pra'\
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 80 443 22

CMD ["sh", "/utils/nginx.sh"]
