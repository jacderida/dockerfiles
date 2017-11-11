FROM centos

MAINTAINER Chris O'Neil <chris.oneil@gmail.com>

RUN yum update -y && yum install -y locales vim zsh

ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8
ENV HOME /home/user
ENV USER user

RUN useradd --create-home --home-dir $HOME user

CMD zsh
