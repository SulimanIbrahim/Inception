FROM alpine:3.20

RUN apk update && apk add php php83 php83-fpm php83-mysqli php83-mbstring php83-gd php83-opcache php83-phar php83-xml mariadb-client wget tar ca-certificates && update-ca-certificates
# FastCGI is a protocol that allows a web server (like Nginx) to communicate with applications that generate dynamic content 
# PHP 8.3 and PHP-FPM (FastCGI Process Manager)
# MySQL drivers for PHP (mysqli)
# Additional PHP extensions needed for WordPress (mbstring, gd, opcache, phar, xml)
# MariaDB client for database connection
# wget and tar for downloading and extracting WordPress

COPY tools/wordpress.sh /wordpress.sh

COPY tools/wp-cli.phar /usr/local/bin/wp
# WP-CLI is a command-line tool specifically designed for managing WordPress installations
# copying the WordPress Command Line Interface (WP-CLI) tool into your container.

RUN chmod +x /usr/local/bin/wp

COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

RUN chmod +x /wordpress.sh

ENTRYPOINT [ "/wordpress.sh" ]