Cachet Docker Image
===================


Get an application key
======================

To run Cachet you will need to populate APP_KEY environment variable with an
Application Key. To get a randomly generated key run

```shell
php artisan key:generate
```

The key is base64 and you need to supply the whole text, including the base64
prefix, to the app. Note that Cachet is very picky about the application key,
make sure that you copy and paste correctly.


Example
=======

The following example starts a MariaDB instance and then Cachet.

```shell
docker run -d --name mariadb -e MYSQL_ROOT_PASSWORD=cachet -e MYSQL_DATABASE=cachet mariadb:10.0
docker run -t -i --link mariadb:db -e DB_DATABASE=cachet -e DB_USERNAME=root -e DB_DRIVER=mysql -e DB_HOST=db -e DB_PASSWORD=cachet -e APP_KEY=base64:y+f7voXkc5sk7rvP2ulGbQD8N2otV3EQrVPYVUYOkbA= -e APP_ENV=production -e APP_DEBUG=False -e APP_URL=http://localhost:5000 -e CACHE_DRIVER=apc -e SESSION_DRIVER=apc -e MAIL_DRIVER=smtp -e MAIL_HOST= -e MAIL_PORT= -e MAIL_USERNAME= -e MAIL_PASSWORD= -e MAIL_ADDRESS= -e MAIL_NAME= -e QUEUE_DRIVER=database giorgos/cachet:v2.2.2
```

Make sure to supply all environment variables, even empty ones. Cachet will fail mysteriously without them.


Credits
=======

This work is based on [Cachet Docker](https://github.com/cachethq/Docker) work.
