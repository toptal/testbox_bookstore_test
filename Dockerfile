# syntax = docker/dockerfile:experimental

FROM ruby:2.5.1

COPY . /test
WORKDIR /test

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN  --mount=type=ssh bundle install

CMD [ "tail", "-f", "/dev/null" ]
