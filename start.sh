#!/usr/bin/env sh

/usr/sbin/php-fpm7.3 --fpm-config /etc/php/7.3/fpm/php-fpm.conf
/usr/sbin/nginx -g 'daemon on; master_process on;'
/usr/bin/sleep infinity
