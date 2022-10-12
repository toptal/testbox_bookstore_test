# syntax = docker/dockerfile:experimental

FROM ruby:3.0.4

COPY . /test
WORKDIR /test

RUN gem install bundler:2.3.21 --no-document

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh bundle install

CMD [ "tail", "-f", "/dev/null" ]
