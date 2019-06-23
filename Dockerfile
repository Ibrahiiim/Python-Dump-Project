From python:3.7-alpine

MAINTAINER Ibrahim Abuaqel <ibrahimabuaquel@gmail.com>

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# to prevent the image from working as root (security matter)
# create a user to run the application
RUN adduser -D user

# assign user to Docker
USER user

