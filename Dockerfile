# syntax = docker/dockerfile:experimental

FROM ruby:3.0.4 as base

COPY . /test
WORKDIR /test

RUN gem install bundler:2.3.21 --no-document

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh bundle install

RUN touch start.sh && chmod +x start.sh
CMD ./start.sh

FROM base AS kubernetes

RUN echo 'bundle exec rspec' >  start.sh

FROM base AS docker

RUN echo 'tail -f /dev/null' >  start.sh
