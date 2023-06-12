#!/bin/bash

if [ ! -e $PWD/logs/wp-debug.log ] ; then
    touch $PWD/logs/wp-debug.log
fi

docker-compose -f docker-compose.yml up -d

chown -R www-data:www-data $PWD/logs
chown -R www-data:www-data $PWD/www
chown -R www-data:www-data $PWD/config

find $PWD/www -type d -exec chmod -R 775 {} \;
find $PWD/www -type f -exec chmod -R 664 {} \;
find $PWD/logs -type f -exec chmod -R 664 {} \;
find $PWD/config -type f -exec chmod -R 664 {} \;