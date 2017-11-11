ANSIBLE_VERSION := 2.1.1.0
AWSCLI_VERSION := 1.11.57
TERRAGRUNT_VERSION := 0.11.0
AZURE_VERSION := 0.10.6

.PHONY: all azure-cli zsh-debian-jessie zsh-python-2-7

all: azure-cli ansible awscli terragrunt

clean: clean-terragrunt clean-ansible clean-azure clean-awscli clean-zsh-debian-jessie clean-zsh-python-2-7

clean-zsh-debian-jessie:
	docker rmi jacderida/zsh:debian-jessie

clean-zsh-python-2-7:
	docker rmi jacderida/zsh:python-2.7

clean-ansible:
	docker rmi jacderida/ansible:${ANSIBLE_VERSION}

clean-azure:
	docker rmi microsoft/azure-cli:${AZURE_VERSION}
	docker rmi jacderida/azure-cli:${AZURE_VERSION}

clean-terragrunt:
	docker rmi jacderida/terragrunt:${TERRAGRUNT_VERSION}

zsh-debian-jessie:
	cd ./zsh/debian-jessie && docker build -t jacderida/zsh:debian-jessie .

zsh-python-2-7:
	cd ./zsh/python-2.7 && docker build -t jacderida/zsh:python-2.7 .

ansible: zsh-debian-jessie
	cd ./ansible/${ANSIBLE_VERSION} && docker build -t jacderida/ansible:${ANSIBLE_VERSION} .

awscli: zsh-python-2-7
	cd ./awscli/${AWSCLI_VERSION} && docker build -t jacderida/awscli:${AWSCLI_VERSION} .

azure-cli:
	cd ./azure-cli/${AZURE_VERSION} && docker build -t jacderida/azure-cli:${AZURE_VERSION} .

terragrunt: zsh-debian-jessie
	cd ./terragrunt/${TERRAGRUNT_VERSION} && docker build -t jacderida/terragrunt:${TERRAGRUNT_VERSION} .
