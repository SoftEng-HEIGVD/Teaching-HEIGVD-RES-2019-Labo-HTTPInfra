# Teaching-HEIGVD-RES-2018-Labo-HTTPInfra

## step 1 : Static HTTP server with apache httpd

### résumer 
Premièrerment créer un dossier Docker-image puis un sous dossier apache-php-image dans un dossier content extraire le zip du thème choisi, Après cella monter un docker php (le docker php contient déjà apache ce qui nous facilite énormément le travail. voici les deux lignes de code que doit contenir le Dockerfile
FROM php:7.2-apache
COPY content/ /var/www/html/
Pour executer le dockerfile faite simplement docker build -t res/apache_php puis docker run -p 9090:80 res/apache_php.
### excecution 
run le script `docker-images/apache-php-image/run.sh`

tester en tapant http://192.168.99.100:9090/ dans la bare d'un navigateur

### Theme 
 Thème  sur https://startbootstrap.com/themes/

### Dockerfile
nous avons trouver l'image php et apache  https://hub.docker.com/_/php

## Step 2: Dynamic HTTP server with express.js
### execution 

on peu lancer le serveur en excecutant le script  `docker-images/express-image/run.sh`


On peu lancer l'image en accedant à l'url  http://192.168.99.100:9091/

On peu aussi y accéder via telnet `telent localhost 9091` et utiliser un `GET / HTTP/1.0.` ou via postman 

### JSON Payload
On génére une list de user 

