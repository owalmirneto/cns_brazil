FROM ruby:2.7.6

RUN apt-get update && apt-get install -y vim

WORKDIR /usr/src/app