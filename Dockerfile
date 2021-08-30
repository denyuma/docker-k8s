FROM debian@sha256:c6e865b5373b09942bc49e4b02a7b361fcfa405479ece627f5d4306554120673

EXPOSE 80
RUN apt update \
  && apt install -y apache2 php libapache2-mod-php \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm /var/www/html/index.html
COPY index.php /var/www/html/
CMD /usr/sbin/apachectl -DFOREGROUND