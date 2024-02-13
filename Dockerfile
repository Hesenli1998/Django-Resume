# pull official base image
FROM python:3.13-slim

RUN apt update

RUN apt install python3-dev build-essential -y

# pip requirements

RUN pip install --upgrade pip
RUN pip install vitualenv && python -m virtualenv venv

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app

RUN python manage.py runserver