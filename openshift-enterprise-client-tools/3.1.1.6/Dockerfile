FROM centos

MAINTAINER Chris O'Neil <chris.oneil@gmail.com>

RUN yum update -y && \
    curl -OL http://repo.openshift3roadshow.com/clients/oc-3.1.1.6-linux.tar.gz && \
    mkdir /opt/oc-3.1.1.6 && \
    tar xvf oc-3.1.1.6-linux.tar.gz -C /opt/oc-3.1.1.6 && \
    mv /opt/oc-3.1.1.6/mnt/redhat/staging-cds/ose-clients-3.1.1.6/usr/share/atomic-openshift/linux/oc /opt/oc-3.1.1.6 && \
    rm -rf /opt/oc-3.1.1.6/mnt && \
    ln -s /opt/oc-3.1.1.6/oc /usr/local/bin/oc && \
    yum clean all -y
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user

WORKDIR $HOME
USER user
