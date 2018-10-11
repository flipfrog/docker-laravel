# docker-laravel
nginx + php-fpm + laravel on docker

## To build images.
1. Execute following commands on host OS.

   ``% mkdir mysql redis www``

   ``% docker-compose up --build``

2. Execute following commands in Containers.

   ``% docker exec -it docker-laravel_app_1 bash``
   
   In app container;
   
   ``% chown -R flipfrog:flipfrog /var/www``
   
   ``% su flipfrog``
   
   ``% cd /var/www``
   
   ``% composer create-project --prefer-dist laravel/laravel laravel``
   
   ``% cd laravel``
   
   ``% composer require predis/predis``
   
   ``% find /var/www -type d -exec chmod 770 {} \;``
   
   ``% find /var/www -type f -exec chmod 770 {} \;``

   - In app container or host OS;

   Edit ``laravel/.env`` as following;
   
   ```
   DB_HOST=mysql
   DB_PORT=3306
   DB_DATABASE=laraveltest
   DB_USERNAME=root
   DB_PASSWORD=secret
   ```   
   ```
   CACHE_DRIVER=redis
   :
   SESSION_DRIVER=redis
   :
   REDIS_HOST=redis
   ```

    *'flipfrog' is user name, you should change it to appropriate user name.
    Also you should change user name in app.docker and web.docker file.*

## To run containers.
Execute following;

   ``% docker-compose up [-d]``

## To stop containers.

- Execute following.

  ``% docker-compose down``
  
- When you want to delete all existing containers and images execute following.
  
  ``% all_delete.sh``
