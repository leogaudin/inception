#!/bin/sh

sleep 10
if [ -f ./wp-config.php ]
then
	#
else
	wp config create	--allow-root \
						--dbname=$SQL_DATABASE \
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
	wp core install		--allow-root \
						--url=$WP_URL \
						--title=$WP_TITLE \
						--admin_user=$WP_ADMIN \
						--admin_password=$WP_ADMIN_PASSWORD \
						--admin_email=$WP_ADMIN_EMAIL \
						--path='/var/www/wordpress'
	wp user create		--allow-root \
						--user_login=$WP_USER \
						--user_pass=$WP_USER_PASSWORD \
						--user_email=$WP_USER_EMAIL \
						--role=author \
						--path='/var/www/wordpress'
