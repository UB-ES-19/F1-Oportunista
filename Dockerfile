FROM python:3.6-alpine
RUN apk add --update nodejs npm
RUN pip install pipenv
#ENV PYTHONUNBUFFERED 1+
COPY Pipfile* /tmp/
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
RUN mkdir /web
WORKDIR /web
ADD . /web
RUN npm install
