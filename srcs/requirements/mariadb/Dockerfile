FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY create.sh /tmp/create.sh
RUN chmod +x /tmp/create.sh

CMD [ "/tmp/create.sh" ]
