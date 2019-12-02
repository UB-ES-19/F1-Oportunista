FROM node
WORKDIR /web
COPY package-lock.json package.json ./
RUN npm install

FROM python:3.6
RUN pip install pipenv
ENV PYTHONUNBUFFERED 1
COPY Pipfile* /tmp/
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
WORKDIR /web
ADD . /web
EXPOSE 3000
#ENTRYPOINT [ "/bin/bash" ]