FROM debian:buster

RUN apt update
RUN apt install -y wget\
				php7.3\
				php-fpm\
				php-mysql

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && cd /
RUN mkdir -p /var/www/wordpress
RUN	chown -R root:root /var/www/wordpress

RUN rm /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/config.sh /tmp/config.sh
COPY conf/wp-config.php /tmp/wp-config.php
RUN chmod +x /tmp/config.sh
CMD [ "/tmp/config.sh" ]

EXPOSE 9000
