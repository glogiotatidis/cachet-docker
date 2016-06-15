#!/bin/bash
cat env.docker | envsubst > .env
php artisan app:install
php artisan config:cache
chmod -R 777 storage
chown www-data.www-data -R /var/www/html
exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
