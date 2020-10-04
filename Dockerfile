# syntax = docker/dockerfile:experimental

FROM gcr.io/compute-engine-1069/ruby:2.5.3-centos as ruby-base

# chromedriver
RUN yum -y install curl unzip xvfb libxi6 libgconf-2-4 openssh-clients git
RUN yum -y install --enablerepo=nodesource,yarn,epel,toptal libexif dejavu-sans-fonts dejavu-serif-fonts dejavu-sans-mono-fonts \
     liberation-fonts-common liberation-sans-fonts x11vnc xorg-x11-server-Xvfb google-cloud-sdk \
     google-chrome-stable
RUN uuidgen | tr -d - > /etc/machine-id

COPY . /test
WORKDIR /test

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN  --mount=type=ssh bundle install

CMD [ "tail", "-f", "/dev/null" ]
