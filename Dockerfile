FROM gitpod/workspace-base:latest

### Apache, PHP ###
LABEL dazzle/layer=tool-apache
LABEL dazzle/test=tests/lang-php.yaml
USER root
ENV TRIGGER_REBUILD=4
RUN add-apt-repository -y ppa:ondrej/php \
    && install-packages \
        apache2 \
        composer \
        php7.3 \
        pphp7.3-dev \
        php7.3-bcmath \
        php7.3-ctype \
        php7.3-curl \
        php7.3-gd \
        php7.3-intl \
        php7.3-mbstring \
        php7.3-mysql \
        php7.3-pgsql \
        php7.3-sqlite3 \
        php7.3-tokenizer \
        php7.3-xml \
        php7.3-zip
#    && ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load \
#    && chown -R gitpod:gitpod /etc/apache2 /var/run/apache2 /var/lock/apache2 /var/log/apache2
#COPY --chown=gitpod:gitpod apache2/ /etc/apache2/

## The directory relative to your git repository that will be served by Apache
ENV APACHE_DOCROOT_IN_REPO="public"

#COPY etc/apache2/apache2.conf /etc/apache2/apache2.conf
#COPY etc/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
#COPY etc/php/30-php.ini /etc/php/7.4/apache2/conf.d/30-php.ini
