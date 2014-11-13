

# Nginx for PFP-FPM with Docker

## Introduction

This image contain only **nginx**, it is designed to work solely with [PHP-FPM](https://registry.hub.docker.com/u/stan/php-fpm/), you can use the container [stan/php-fpm](https://registry.hub.docker.com/u/stan/php-fpm/).

## How to use this image

Pull the image from Docker Hub

```bash
docker pull stan/nginx-phpfpm
```

Start a nginx instance, you have to link a container which contain PHP-FPM on port 9000, it have to be linked with alias 'phpfpm'.

```bash
docker run -d --name nginx-phpfpm --link your-container-phpfpm:phpfpm stan/nginx-phpfpm
```

Start a nginx instance with a volume mapped with _document root_ of nginx (same volume as PHP-FPM container)

```bash
docker run -d --name nginx --link your-container-phpfpm:phpfpm -v /your/php/project:/var/www stan/nginx-phpfpm
```

Start [**stan/php-fpm**](https://registry.hub.docker.com/u/stan/php-fpm/) container and the web server container (nginx)

```bash
docker run -d --name php54 -v /your/php/project:/var/www stan/php-fpm
docker run -d --name nginx -p 80:80 --link php54:phpfpm -v /your/php/project:/var/www stan/nginx-phpfpm 
```

## Feedback

### Issues

If you have any problems with or questions about this image, please contact us through an [issue](https://github.com/tsunammis/docker-nginx-phpfpm/issues).

### Contributing

You are invited to contribute new features, fixes or updates, large or small,  we are always trilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through an [issue](https://github.com/tsunammis/docker-nginx-phpfpm/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

