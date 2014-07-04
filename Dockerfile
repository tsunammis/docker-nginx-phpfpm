FROM stan/nginx

MAINTAINER Stan Chollet <stanislas.chollet@gmail.com>

# NGINX
ADD default /etc/nginx/sites-available/default
ADD default /etc/nginx/sites-enabled/default

# PHP Welcome page
RUN touch /var/www/index.php
RUN echo '<?php $w = "Steve"; echo "Welcome $w"; ?>' > /var/www/index.php
RUN chown -R www-data:www-data -R /var/www
RUN chmod 755 /var/www
RUN chmod 644 /var/www/index.php

# Setup file
ADD setup.sh /root/setup.sh
RUN chmod +x /root/setup.sh

# Clear
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose HTTP Port
EXPOSE 80

CMD /bin/bash /root/setup.sh && service nginx start
