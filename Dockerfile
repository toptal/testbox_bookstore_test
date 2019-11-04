FROM ruby:2.5.1

COPY . /test
WORKDIR /test
RUN bundle install

CMD [ "tail", "-f", "/dev/null" ]
