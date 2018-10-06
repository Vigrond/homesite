#  Sets up a docker image with Python and Nginx
#  Copies our Homesite code and installs required Python libraries.

FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y \
  nginx postgresql-client

RUN mkdir /code
WORKDIR /code

ADD requirements.txt /code/
RUN pip3 install -r requirements.txt
