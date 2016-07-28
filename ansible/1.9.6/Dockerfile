FROM debian:jessie

MAINTAINER Chris O'Neil <c.oneil@cgi.com>

RUN apt-get update && apt-get install -y git libffi-dev libssl-dev python-dev python-pip && pip install -U cffi
RUN pip install --upgrade pyasn1 setuptools && pip install ansible==1.9.6

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user

WORKDIR $HOME
USER user
