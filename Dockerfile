FROM debian
EXPOSE 80
RUN apt update \
  && apt install -y apache2 php libapache2-mod-php \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm /var/www/html/index.html \
  && mkdir /var/data
COPY index.php /var/www/html/
COPY cart.php /var/www/html/
CMD /usr/sbin/apachectl -DFOREGROUND