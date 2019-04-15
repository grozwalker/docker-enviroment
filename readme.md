### Requirements

* docker
* docker-compose

#### Install fresh Laravel

1. Copy `mysql` or `postgres` folder to your app folder.
2. In makefile set `project_name` variable (the same as in the docker-compose file)
3. 
```
$> make up
$> make fresh-install
```

4. Add `/docker/dev/db` to .gitignore file


#### Install from existing repository

1. Copy the contents of the desired folder to the root of your project 


2. In makefile set `project_name` variable (the same as in the docker-compose file)

3. In `docker-compose.yml` replace `project-name` to your specific name.
For example:
``project-name_app_1 -> blue_whale_app_1``

3. 
```
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

4. Add `/docker/dev/db` to .gitignore file

and that's all!

###Build front

**Warning!** Compatible with Ilya Biryukov's (https://github.com/uncleF) Front TemplateX (https://github.com/uncleF/TemplateX) and folder structure: markup-php

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
