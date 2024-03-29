FROM gitpod/workspace-base:latest

### Docker ###
LABEL dazzle/layer=tool-docker
LABEL dazzle/test=tests/tool-docker.yaml
USER root
ENV TRIGGER_REBUILD=3
# https://docs.docker.com/engine/install/ubuntu/
RUN curl -o /var/lib/apt/dazzle-marks/docker.gpg -fsSL https://download.docker.com/linux/ubuntu/gpg \
    && apt-key add /var/lib/apt/dazzle-marks/docker.gpg \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && install-packages docker-ce docker-ce-cli containerd.io

RUN curl -o /usr/bin/slirp4netns -fsSL https://github.com/rootless-containers/slirp4netns/releases/download/v1.1.12/slirp4netns-$(uname -m) \
    && chmod +x /usr/bin/slirp4netns

RUN curl -o /usr/local/bin/docker-compose -fsSL https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 \
    && chmod +x /usr/local/bin/docker-compose

### Apache, PHP ###
LABEL dazzle/layer=tool-apache
LABEL dazzle/test=tests/lang-php.yaml
USER root
ENV TRIGGER_REBUILD=4
RUN add-apt-repository -y ppa:ondrej/php \
    && install-packages \
        apache2 \
        php7.4 \
        php7.4-dev \
        php7.4-bcmath \
        php7.4-ctype \
        php7.4-curl \
        php7.4-gd \
        php7.4-intl \
        php7.4-mbstring \
        php7.4-mysql \
        php7.4-pgsql \
        php7.4-sqlite3 \
        php7.4-tokenizer \
        php7.4-xml \
        php7.4-zip
RUN install-packages \
    composer

COPY apache2/php.ini /etc/php/7.4/apache2/php.ini
COPY apache2/apache2.conf /etc/apache2/

#    && ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load \
#    && chown -R gitpod:gitpod /etc/apache2 /var/run/apache2 /var/lock/apache2 /var/log/apache2
#COPY --chown=gitpod:gitpod apache2/ /etc/apache2/

## The directory relative to your git repository that will be served by Apache
#ENV APACHE_DOCROOT_IN_REPO="public"

#COPY etc/apache2/apache2.conf /etc/apache2/apache2.conf
#COPY etc/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
#COPY etc/php/30-php.ini /etc/php/7.4/apache2/conf.d/30-php.ini
