FROM ubuntu:18.04

MAINTAINER Ejiroghene Agarin "ejirocecil@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

COPY . /

WORKDIR /

RUN pip3 install -r requirements.txt

CMD uwsgi --socket 0.0.0.0:5000 --protocol=http -w wsgi:app
