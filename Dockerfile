FROM debian:buster-slim
EXPOSE 80/tcp
RUN apt-get update && apt-get install -y nginx php-common \
php-fpm \ 
php7.3-cli \
php7.3-common \ 
php7.3-curl \ 
php7.3-fpm \
php7.3-json \
php7.3-mbstring \
php7.3-opcache \
php7.3-readline \ 
php7.3-tidy \ 
php7.3-xml
ADD full-text-rss/ /var/www/full-text-rss
COPY fulltextrss /etc/nginx/sites-available
RUN mkdir /run/php && rm /etc/nginx/sites-enabled/default && \
ln -s /etc/nginx/sites-available/fulltextrss /etc/nginx/sites-enabled/fulltextrss && \
chown -R www-data:www-data /var/www/full-text-rss
ENTRYPOINT /usr/sbin/php-fpm7.3 --fpm-config /etc/php/7.3/fpm/php-fpm.conf && \
/usr/sbin/nginx -g 'daemon on; master_process on;'
