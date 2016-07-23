FROM microsoft/azure-cli

MAINTAINER Chris O'Neil <chris.oneil@gmail.com>

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user \
    && mkdir -p $HOME/.azure \
    && chown -R user:user $HOME/.azure

WORKDIR $HOME
USER user
