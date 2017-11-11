FROM jacderida/zsh:centos

MAINTAINER Chris O'Neil <chris.oneil@gmail.com>

RUN yum update -y && \
    curl -OL https://github.com/openshift/origin/releases/download/v1.2.1/openshift-origin-client-tools-v1.2.1-5e723f6-linux-64bit.tar.gz && \
    tar xvf openshift-origin-client-tools-v1.2.1-5e723f6-linux-64bit.tar.gz -C /opt && \
    ln -s /opt/openshift-origin-client-tools-v1.2.1-5e723f6-linux-64bit/oc /usr/local/bin/oc && \
    yum clean all -y
