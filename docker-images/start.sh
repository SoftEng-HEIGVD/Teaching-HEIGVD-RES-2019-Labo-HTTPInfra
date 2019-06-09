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
docker run -d --name apache_static res/apache_static
echo " "

echo "########### Run express_dynamic ###########"
docker run -d --name express_students res/express_students
echo " "

echo "########### Run apache_rp ###########"
docker run -d -p 8080:80 -e STATIC_APP=172.17.0.2:80 -e DYNAMIC_APP=172.17.0.3:3000 --name apache_rp res/apache_rp
echo " "

echo "########### check ip apache_static container (should be 172.17.0.2) ###########"
docker inspect apache_static | grep -i ipaddress
echo " "

echo "########### check ip express_dynamic conatiner (should be 172.17.0.3) ###########"
docker inspect express_students | grep -i ipaddress