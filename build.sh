sudo docker build -t oportunista .
sudo docker volume create --name oportunista-volume

sudo docker network create mynet
sudo docker run -d -it --network mynet -p 3306:3306 --name mysql -e MYSQL_USER=root -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=oportunista mysql/mysql-server
#sudo docker run -it --network mynet -p 8000:8000 oportunista python idealista/manage.py runserver