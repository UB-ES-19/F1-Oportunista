sudo docker build --target database -t oportunista-database .
sudo docker build -t oportunista .

sudo docker network create mynet
sudo docker run -dit --network mynet -p 3306:3306 --name mysql oportunista-database
sudo docker run -it --network mynet -p 8000:8000 --rm oportunista python idealista/manage.py runserver 0.0.0.0:8000

#sudo docker stop mysql && sudo docker rm mysql
#sudo docker network rm mynet
