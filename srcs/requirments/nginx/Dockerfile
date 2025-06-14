# Use Alpine Linux as the base image (using penultimate stable version)
FROM alpine:3.18

# Install nginx and openssl packages
RUN apk update && \
    apk add --no-cache nginx

# Create directory for SSL certificates
RUN mkdir -p /etc/ssl/private /etc/ssl/certs

# Create directory for website data
RUN mkdir -p /var/www/html/wordpress

# Copy nginx configuration and startup script
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/start.sh /start.sh

# Make the startup script executable
RUN chmod +x /start.sh

# Expose port 443 (HTTPS)
EXPOSE 443

# Start with our custom script (which handles SSL and starts NGINX)
CMD ["/start.sh"]