ANSIBLE_VERSION := 2.1.1.0

.PHONY: all zsh

all: ansible

clean: clean-ansible clean-zsh

clean-zsh:
	docker rmi jacderida/zsh:latest

clean-ansible:
	docker rmi jacderida/ansible:${ANSIBLE_VERSION}

zsh:
	cd ./zsh/latest && docker build -t jacderida/zsh:latest .

ansible: zsh
	cd ./ansible/${ANSIBLE_VERSION} && docker build -t jacderida/ansible:${ANSIBLE_VERSION} .
