FROM ruby:2.4

RUN apt-get update -qq
RUN apt-get install -y build-essential git curl vim

RUN mkdir /app
WORKDIR /app
ADD . /app

RUN bundle update && bundle install
