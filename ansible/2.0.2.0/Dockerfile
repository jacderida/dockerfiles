FROM debian:jessie

MAINTAINER Chris O'Neil <c.oneil@cgi.com>

RUN apt-get update && apt-get install -y libffi-dev libssl-dev python-dev python-pip && pip install -U cffi
RUN apt-get install -y git
RUN pip install --upgrade pyasn1 setuptools
RUN pip install ansible==2.0.2.0

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user

WORKDIR $HOME
USER user
