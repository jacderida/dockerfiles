.PHONY: all zsh

clean-zsh:
	docker rmi jacderida/zsh:latest

zsh:
	cd ./zsh/latest && docker build -t jacderida/zsh:latest .

ansible: zsh
	cd ./ansible/2.1.1.0 && docker build -t jacderida/ansible:2.1.1.0 .
