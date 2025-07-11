FROM alpine:3.20

RUN apk update
RUN apk add mariadb mariadb-common mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

ADD ./tools/run_mariadb.sh .
RUN chmod +x /run_mariadb.sh
EXPOSE 3306

ENTRYPOINT [ "./run_mariadb.sh" ]