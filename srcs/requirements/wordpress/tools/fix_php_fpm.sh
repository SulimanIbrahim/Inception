#!/bin/sh

# Update PHP-FPM configuration to listen on all interfaces
sed -i 's|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g' /etc/php81/php-fpm.d/www.conf

# Restart PHP-FPM to apply changes
killall php-fpm81
/usr/sbin/php-fpm81 -FR
