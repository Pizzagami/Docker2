service php7-fpm start
wget -c https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.gz -O - | tar -xz -C /var/www
mv var/www/phpMyAdmin-4.9.2-english var/www/phpmyadmin
chown -R www-data: /var/www/phpmyadmin
nginx -g 'daemon off;'

service nginx restart
