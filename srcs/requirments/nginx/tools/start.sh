#!/bin/sh

# Install openssl if not already installed
apk add --no-cache openssl

# Check if SSL certificates already exist
if [ ! -f "/etc/ssl/private/nginx-selfsigned.key" ] || [ ! -f "/etc/ssl/certs/nginx-selfsigned.crt" ]; then
    echo "Generating SSL certificates..."
    
    # Generate self-signed SSL certificate
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
        -out /etc/ssl/certs/nginx-selfsigned.crt \
        -subj "/C=AE/ST=AbuDhabi/L=AbuDhabi/O=42/CN=suibrahi.42.fr"
    
    # Set proper permissions
    chmod 600 /etc/ssl/private/nginx-selfsigned.key
    chmod 644 /etc/ssl/certs/nginx-selfsigned.crt
    
    echo "SSL certificates generated successfully."
else
    echo "SSL certificates already exist."
fi

# Start NGINX in the foreground
echo "Starting NGINX..."
exec nginx -g "daemon off;"
