#!/usr/bin/env sh

TARGET=/var/www/full-text-rss/config.php

if test -z "$RSSMAX"
	then true
else
	sed "s/max_entries\ \=\ 10/max_entries\ \=\ $RSSMAX/g" $TARGET | sponge $TARGET
fi

echo "RSSMAX is $RSSMAX"

echo "starting php-fpm"
/usr/sbin/php-fpm7.3 --fpm-config /etc/php/7.3/fpm/php-fpm.conf

echo "starting nginx"
/usr/sbin/nginx 

echo "sleep infinity"
/bin/sleep infinity
