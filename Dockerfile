FROM gitpod/workspace-full

USER root

USER gitpod
RUN apt-get remove -yq php8.0
## Install php7.3 extension
RUN apt-get update -yqq \
    && apt-get install -yqq \
    php7.3-pgsql \
	php7.3-mysql \
	php7.3-opcache \
	php7.3-common \
	php7.3-mbstring \
	php7.3-soap \
	php7.3-cli \
	php7.3-intl \
	php7.3-json \
	php7.3-xsl \
	php7.3-imap \
	php7.3-ldap \
	php7.3-curl \
	php7.3-gd  \
	php7.3-dev \
    php7.3-fpm \
    php7.3-bcmath \
    php7.3-imagick \
    php7.3-zip \
    php7.3-zmq \
    php7.3-apcu \
    && apt-get install pkg-config

#COPY etc/apache2/apache2.conf /etc/apache2/apache2.conf
#COPY etc/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
#COPY etc/php/30-php.ini /etc/php/7.4/apache2/conf.d/30-php.ini
