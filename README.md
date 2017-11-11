# dockerfiles

Where I have the choice, rather than running applications natively, I've decided to package them in containers and run them in isolation. There are a few advantages to this approach:

* They can easily be reconstructed and then run on any operating system with support for Docker
* Easy to maintain different application versions
* The isolation means you never get conflicting dependencies
* Docker is extremely fast to start

Drawbacks:

* Containers use a lot more disk space than installing the applications natively (this can be mitigated to an extent with minimal operating systems like Alpine)
* Dockerfile maintenance can be clunky (especially since Docker doesn't have a multiple inheritance system)
* Docker itself introduces some complexity where there otherwise wouldn't be

## ZSH Base Containers

To simplify Dockerfile development, these containers are intended to be run in interactive mode. For that reason, I like to maintain the shell prompt from my host machine, so my system is to use base containers that install ZSH and UTF-8 locales. When running the container, I can mount in my zshrc and the `oh-my-zsh` directory. Due to a lack of a multiple inheritance system in Docker, there's a lot of duplication in the Dockerfiles, but I've decided to accept this limitation. The reality is the container definitions don't get updated that much.

## Build

A makefile is available for building the images in the suite.

Each image can be built with an individual target:
```shell
make ansible
```

The entire suite can be built:
```shell
make all
```

Using `clean` targets, the same follows for removing images. There's a `clean-base-images` target that will also remove the base operating system images.

## The Suite

The following table lists the images and their versions:

| Name                          | Latest Version | Base                |
| ----------------------------- | -------------- | ------------------- |
| Ansible                       | 2.1.1.0        | ZSH Debian Jessie   |
| AWS CLI                       | 1.11.57        | ZSH Python 2.7      |
| Azure CLI                     | 0.10.6         | Microsoft Azure CLI |
| Openshift Origin Client Tools | 1.2.1          | ZSH CentOS          |
| Terragrunt                    | 0.11.0         | ZSH Debian Jessie   |
