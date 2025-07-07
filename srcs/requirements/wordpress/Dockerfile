FROM  alpine:3.18

# Update System and Install Tools
RUN apk update
RUN apk add openrc

# Install PHP and extensions
RUN apk --no-cache add php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring \
	php-mysqlnd php-gd php-xml php-intl php-zip php-mysqli php-pdo_mysql php-phar

# Download WordPress and untar it
RUN apk add --no-cache curl
RUN curl -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" https://wordpress.org/latest.tar.gz -o latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm latest.tar.gz

# Download and setup wp-cli to handle wordpress users
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# start openrc
RUN openrc
RUN touch /run/openrc/softlevel

# Copy installing script and make it executable
COPY ./tools/wordpress.sh /usr/local/bin/wordpress.sh
RUN chmod +x /usr/local/bin/wordpress.sh
EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/wordpress.sh" ]