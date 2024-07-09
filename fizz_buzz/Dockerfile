FROM ruby:3.3.3

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY fizz_buzz/src/Gemfile fizz_buzz/src/Gemfile.lock ./
RUN bundle install

