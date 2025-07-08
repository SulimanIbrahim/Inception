FROM alpine:3.20

# Update System and Install Tools
RUN apk update
RUN apk add mariadb mariadb-common mariadb-client openrc

# start openrc
RUN openrc
RUN touch /run/openrc/softlevel

 
# Copy installing script and make it executable
ADD ./tools/run_mariadb.sh .
RUN chmod +x /run_mariadb.sh
EXPOSE 3306

ENTRYPOINT [ "./run_mariadb.sh" ]