FROM node
WORKDIR /web
COPY package-lock.json package.json ./
RUN npm install

FROM mysql:5.7
ARG MYSQL_USER=root
ARG MYSQL_PASSWORD=password
ARG MYSQL_ROOT_PASSWORD=password
ARG MYSQL_DATABASE=oportunista
EXPOSE 3306

FROM python:3.6
RUN pip install pipenv
ENV PYTHONUNBUFFERED 1
COPY Pipfile* /tmp/
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
WORKDIR /web
ADD . /web
EXPOSE 3000
ENTRYPOINT [ "/bin/bash" ]