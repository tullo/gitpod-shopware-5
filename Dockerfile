FROM gitpod/workspace-full

USER root

USER gitpod
RUN sudo apt-get remove -yq php8.0 &&
  sudo add-apt-repository ppa:ondrej/php &&
  sudo apt-get update -q &&
  sudo apt-get install -yq php7.3 &&
  sudo rm -rf /var/lib/apt/lists/*

COPY etc/apache2/apache2.conf /etc/apache2/apache2.conf
COPY etc/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY etc/php/30-php.ini /etc/php/7.4/apache2/conf.d/30-php.ini
