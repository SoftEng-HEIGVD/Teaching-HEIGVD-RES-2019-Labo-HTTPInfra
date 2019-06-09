echo "########### Kill all containers... ###########"
docker kill $(docker ps -qa)
echo " "

echo "########### Remove all container... ###########"
docker rm $(docker ps -qa)
echo " "

echo "########### Build apache_static ########### "
docker build -t res/apache_static ./apache-php-image/
echo " "

echo "########### Build express_dynamic ########### "
docker build -t res/express_students ./express-image/
echo " "

echo "########### Build apache_rp ###########"
docker build -t res/apache_rp ./apache-reverse-proxy/
echo " "

echo "########### Run apache_static container ###########"
docker run -d res/apache_php #useless
docker run -d res/apache_php #useless
docker run -d --name apache_static1 res/apache_php
docker run -d --name apache_static2 res/apache_php
echo " "

echo "########### Run express_students ###########"
docker run -d res/express_students #useless
docker run -d res/express_students #useless
docker run -d --name express_dynamic1 res/express_students
docker run -d --name express_dynamic2 res/express_students

echo " "

echo "########### Run apache_rp ###########"
static_app1=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' apache_static1`
static_app2=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' apache_static2`
dynamic_app1=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' express_dynamic1`
dynamic_app2=`docker inspect --format '{{ .NetworkSettings.IPAddress }}' express_dynamic2`
echo " "

echo "## IP of injected: static $static_app1, $static_app2 and dynamic $dynamic_app1, $dynamic_app2\n" 
docker run -d -p 8080:80 -e STATIC_APP1=$static_app1:80 -e STATIC_APP2=$static_app2:80 -e DYNAMIC_APP1=$dynamic_app1:3000 -e DYNAMIC_APP2=$dynamic_app2:3000 --name apache_rp res/apache_rp
