### Requirements

* docker
* docker-compose

#### Install fresh Laravel

1. Copy `mysql` or `postgres` folder to your app folder.
2. 
```
$> cp docker.env.example docker.env # Set variables
$> make fresh-install
```
3. Add `/docker/dev/db` and `docker.env` to .gitignore file


#### Install from existing repository

1. Copy the contents of the desired folder to the root of your project 

2. 
```
$> cp docker.env.example docker.env # Set variables
$> make up
$> make prepare-app
$> make prepare-db
```

or

```
$> docker-compose up
$> docker exec -it project-name_app_1 bash #go to the docker container
$> composer install
$> chmod a+rw storage -R
$> cp .env.example.docker .env
$> php artisan key:generate
$> php artisan storage:link
$> php artisan migrate
$> php artisan db:seed
```

. Add `/docker/dev/db` and `docker.env` to .gitignore file

and that's all!

###Build front

```
$> make build-front #  npm install, run grunt build fast, copy assets from markub build to php/publci 
```

And build without npm install

```
$> make build-front-fast #  run grunt build fast, copy assets from markub build to php/publci 
```

#####P.s. 

There may be a permission issue with the folder where the database is stored when you recreate the container. 

Run this: `sudo chmod 777 -R ./docker/dev/db`
