FROM debian:stretch
MAINTAINER tomte76 <dt@admindu.de>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN mkdir -p /var/cache/apt/archives/partial
RUN touch /var/cache/apt/archives/lock
RUN chmod 640 /var/cache/apt/archives/lock
RUN apt-get clean 
RUN apt-get update --fix-missing

# PHP7 lamp version
RUN apt-get -y install apt-transport-https lsb-release ca-certificates wget vim locales-all
RUN apt-get -y install apache2 php mysql-server exim4-daemon-heavy php-mysql php-imap clamav-daemon clamav-freshclam spamassassin mailman

RUN mkdir -p /serv/vmail
RUN adduser --system --uid 99 --home /serv/vmail --disabled-password --disabled-login --group vexim
RUN chown -R vexim:vexim /serv/vmail

ADD mysql.sql /tmp/
ADD vexim /var/www/html/vexim
ADD variables.php /var/www/html/vexim/config/

ADD init.sh /bin/
RUN chmod 755 /bin/init.sh

EXPOSE 80 3306

CMD ["/bin/init.sh"]
