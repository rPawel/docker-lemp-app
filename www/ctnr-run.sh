#!/bin/bash
PERSISTENT_CONFIG_FOLDER="/root/.persistent-config"
PERSISTENT_IGNORED_CONFIG_FOLDER=$PERSISTENT_CONFIG_FOLDER/.ignore
VOLATILE_CONFIG_FOLDER="/"

mkdir -p /var/log/php5 /var/log/nginx /var/www/app/public
chmod 775 /var/log/php5 /var/log/nginx /var/www/app/public
find /var/log/php5 /var/log/nginx -type f -exec chmod 644 {} \; 
chown -R user:www-data /var/log/php5 /var/log/nginx /var/www/app

cp -ar ${PERSISTENT_CONFIG_FOLDER}/* ${VOLATILE_CONFIG_FOLDER}

# start container
exec /usr/bin/supervisord -c /etc/supervisord.conf
