FROM jacderida/zsh:debian-jessie

MAINTAINER Chris O'Neil <c.oneil@cgi.com>

ENV TERRAFORM_VERSION=0.8.8
ENV TERRAGRUNT_VERSION=0.11.0
ENV NODE_VERSION=6.10.0

RUN apt-get update && \
    apt-get install -y git wget xz-utils unzip && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    wget https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    mv terragrunt_linux_amd64 /usr/bin/terragrunt && \
    chmod +x /usr/bin/terragrunt && \
    wget https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz && \
    tar -xvf node-v${NODE_VERSION}-linux-x64.tar.xz -C /usr/local --strip-components=1 && \
    npm install -g azure-cli && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
