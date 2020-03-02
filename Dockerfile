FROM ruby:2.5.1

ARG BUNDLE_GITHUB__COM
ENV BUNDLE_GITHUB__COM=$BUNDLE_GITHUB__COM

COPY . /test
WORKDIR /test
RUN bundle install

CMD [ "tail", "-f", "/dev/null" ]
