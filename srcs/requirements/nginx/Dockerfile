# Use Alpine Linux as the base image (using penultimate stable version)
FROM alpine:3.20

# Install nginx and openssl packages
RUN apk update && \
    apk add --no-cache nginx openssl

# Create directory for SSL certificates
RUN mkdir -p /etc/ssl/private /etc/ssl/certs

# Create directory for website data
RUN mkdir -p /var/www/html/wordpress

# Copy nginx configuration and startup script
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/start.sh /start.sh

# Make the startup script executable
RUN chmod +x /start.sh

# Generate SSL certificates during build
RUN mkdir -p /etc/ssl/private /etc/ssl/certs && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=AE/ST=AbuDhabi/L=AbuDhabi/O=42/CN=suibrahi.42.fr" && \
    chmod 600 /etc/ssl/private/nginx-selfsigned.key && \
    chmod 644 /etc/ssl/certs/nginx-selfsigned.crt

# Expose port 443 (HTTPS)
EXPOSE 443

# Start with our custom script (which handles SSL and starts NGINX)
CMD ["/start.sh"]