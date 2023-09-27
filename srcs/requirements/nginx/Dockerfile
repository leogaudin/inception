FROM debian:buster

# NGINX
RUN apt update
RUN apt install -y nginx

# SSL
RUN mkdir -p /etc/nginx/ssl
RUN apt install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/tls.crt -keyout /etc/nginx/ssl/tls.key -subj "/C=ES/ST=Malaga/L=Malaga/O=42/OU=malaga/CN=lgaudin.42.fr/UID=lgaudin"

RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
