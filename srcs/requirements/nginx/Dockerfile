# Use Alpine Linux as the base image (using penultimate stable version)
FROM alpine:3.20

RUN apk update && \
    apk add --no-cache nginx openssl

RUN mkdir -p /var/www/html/wordpress

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/start.sh /start.sh

RUN chmod +x /start.sh

RUN mkdir -p /etc/ssl/private /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=AE/ST=AbuDhabi/L=AbuDhabi/O=42/CN=suibrahi.42.fr" && \
    chmod 600 /etc/ssl/private/nginx-selfsigned.key && \
    chmod 644 /etc/ssl/certs/nginx-selfsigned.crt

EXPOSE 443

CMD ["/start.sh"]