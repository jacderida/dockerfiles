FROM microsoft/azure-cli:0.10.6

MAINTAINER Chris O'Neil <chris.oneil@gmail.com>

RUN apt-get update -y && \
    apt-get install -y curl git locales vim zsh && \
    sed -i 's/^#\s*en_GB\.UTF-8\s*UTF-8/en_GB\.UTF-8 UTF-8/g' /etc/locale.gen && \
    /usr/sbin/locale-gen

ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8
ENV HOME /home/user
ENV USER user

RUN useradd --create-home --home-dir $HOME user

CMD zsh
