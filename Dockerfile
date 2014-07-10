FROM nginx

MAINTAINER Stan Chollet <stanislas.chollet@gmail.com>

# NGINX
ADD nginx.conf /etc/nginx.conf

# PHP Welcome page
RUN mkdir /var/www /var/logs
RUN touch /var/www/index.php
RUN echo '<?php $w = "Steve"; echo "Welcome $w"; ?>' > /var/www/index.php
RUN chown -R www-data:www-data -R /var/www
RUN chmod 755 /var/www
RUN chmod 644 /var/www/index.php

# Setup file
ADD setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

WORKDIR /var/www

# Expose HTTP Port
EXPOSE 80

CMD /bin/bash /root/setup.sh && nginx
