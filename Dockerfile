FROM node
WORKDIR /web
COPY package-lock.json package.json ./
RUN npm install

FROM mysql/mysql-server AS database
ENV MYSQL_USER root 
ENV MYSQL_PASSWORD password 
ENV MYSQL_ROOT_PASSWORD password 
ENV MYSQL_DATABASE oportunista 
EXPOSE 3306

FROM python:3.6 AS server
RUN pip install pipenv
ENV PYTHONUNBUFFERED 1
COPY Pipfile* /tmp/
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
WORKDIR /web
ADD . /web
EXPOSE 8000
#ENTRYPOINT [ "python", "idealista/manage.py" ]