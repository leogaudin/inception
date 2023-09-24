FROM debian:buster

RUN apt update
RUN apt install -y wget\
				php7.3\
				php-fpm\
				php-mysql

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN tar -xvf /var/www/wordpress-6.0-fr_FR.tar.gz -C /var/www/
RUN rm /var/www/wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN rm /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/config.sh /tmp/config.sh
RUN chmod +x /tmp/config.sh

CMD [ "/tmp/config.sh" ]
