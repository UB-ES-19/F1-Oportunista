sudo docker build -t oportunista .

sudo docker network create mynet
sudo docker run -dit --name mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=password -e  MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=oportunista  mysql
#sudo docker run -it --network mynet -p 3306:3306 --name mysql mysql/mysql-server --rm
#sudo docker run -it --network mynet -p 8000:8000 --rm oportunista runserver 0.0.0.0:8000