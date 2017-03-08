FROM python:2.7

MAINTAINER Chris O'Neil <c.oneil@cgi.com>

ENV AWS_CLI_VERSION=1.11.57

RUN apt-get update && \
    apt-get install -y groff jq && \
    pip install awscli==${AWS_CLI_VERSION} && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user

WORKDIR $HOME
USER user
CMD ["bash"]
