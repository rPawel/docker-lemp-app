#!/bin/bash
chmod 775 /var/log/php5 /var/log/nginx; find /var/log/php5 /var/log/nginx -type f -exec chmod 644 {} \; ; chown -R user:www-data /var/log/php5 /var/log/nginx
exec /usr/bin/supervisord -c /etc/supervisord.conf
