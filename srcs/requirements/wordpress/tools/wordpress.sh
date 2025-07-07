#!/bin/sh


# Copy Folder of WordPress to mounted volume
cp -r /wordpress/* /var/www/html/wordpress/

# Set the Database Credentials
# sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /var/www/html/wordpress/wp-config-sample.php
sed -i 's|database_name_here|'${DATABASE_NAME}'|g' /var/www/html/wordpress/wp-config-sample.php
sed -i 's|username_here|'${DATABASE_USER}'|g' /var/www/html/wordpress/wp-config-sample.php
sed -i 's|password_here|'${DATABASE_PASS}'|g' /var/www/html/wordpress/wp-config-sample.php
sed -i 's|localhost|'${DATABASE_HOST}'|g' /var/www/html/wordpress/wp-config-sample.php

mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
# Set proper permissions
chmod -R 777 /var/www/html/wordpress
chown -R nobody:nobody /var/www/html/wordpress
cd /var/www/html/wordpress/
sleep 5
wp core install --url="$DOMAIN_NAME" --title="$CORE_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_USER_PASS" --admin_email="$ADMIN_USER_EMAIL"

# Create the administrator user in wordpress
# wp user create "$ADMIN_USER" "$ADMIN_USER_EMAIL" --role=administrator --user_pass="$ADMIN_USER_PASS" --skip-email

# Create the normal user in wordpress
wp user create "$NORMAL_USER" "$NORMAL_USER_EMAIL" --role=subscriber --user_pass="$NORMAL_USER_PASS" 

# Update PHP-FPM configuration to listen on all interfaces
sed -i 's|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g' /etc/php81/php-fpm.d/www.conf

# This is a variant of PHP that will run in the background as a daemon, listening for CGI requests.
/usr/sbin/php-fpm81 -FR