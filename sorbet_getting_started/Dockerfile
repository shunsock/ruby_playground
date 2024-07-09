FROM ruby:3.3.3

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY sorbet_getting_started/src/Gemfile sorbet_getting_started/src/Gemfile.lock ./
RUN bundle install

