ANSIBLE_VERSION := 2.1.1.0
AWSCLI_VERSION := 1.11.57
TERRAGRUNT_VERSION := 0.11.0
AZURE_VERSION := 0.10.6
OPENSHIFT_ORIGIN_VERSION := 1.2.1

.PHONY: all azure-cli zsh-debian-jessie zsh-python-2-7

all: azure-cli ansible awscli openshift-origin-cli terragrunt

clean: clean-terragrunt clean-ansible clean-azure clean-awscli clean-openshift-origin clean-zsh-centos clean-zsh-debian-jessie clean-zsh-python-2-7

clean-zsh-debian-jessie:
	docker rmi -f jacderida/zsh:debian-jessie

clean-zsh-python-2-7:
	docker rmi -f jacderida/zsh:python-2.7

clean-zsh-centos:
	docker rmi -f jacderida/zsh:centos

clean-ansible:
	docker rmi -f jacderida/ansible:${ANSIBLE_VERSION}

clean-awscli:
	docker rmi -f jacderida/awscli:${AWSCLI_VERSION}

clean-azure:
	docker rmi -f jacderida/azure-cli:${AZURE_VERSION}
	docker rmi -f microsoft/azure-cli:${AZURE_VERSION}

clean-openshift-origin:
	docker rmi -f jacderida/openshift-origin-client-tools:${OPENSHIFT_ORIGIN_VERSION}

clean-terragrunt:
	docker rmi -f jacderida/terragrunt:${TERRAGRUNT_VERSION}

zsh-debian-jessie:
	cd ./zsh/debian-jessie && docker build -t jacderida/zsh:debian-jessie .

zsh-python-2-7:
	cd ./zsh/python-2.7 && docker build -t jacderida/zsh:python-2.7 .

zsh-centos:
	cd ./zsh/centos && docker build -t jacderida/zsh:centos .

ansible: zsh-debian-jessie
	cd ./ansible/${ANSIBLE_VERSION} && docker build -t jacderida/ansible:${ANSIBLE_VERSION} .

awscli: zsh-python-2-7
	cd ./awscli/${AWSCLI_VERSION} && docker build -t jacderida/awscli:${AWSCLI_VERSION} .

azure-cli:
	cd ./azure-cli/${AZURE_VERSION} && docker build -t jacderida/azure-cli:${AZURE_VERSION} .

openshift-origin-cli: zsh-centos
	cd ./openshift-origin-client-tools/${OPENSHIFT_ORIGIN_VERSION} && docker build -t jacderida/openshift-origin-client-tools:${OPENSHIFT_ORIGIN_VERSION} .

terragrunt: zsh-debian-jessie
	cd ./terragrunt/${TERRAGRUNT_VERSION} && docker build -t jacderida/terragrunt:${TERRAGRUNT_VERSION} .
