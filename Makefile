.PHONY: run
run:
	ansible-playbook --ask-become-pass bootstrap.yml

.PHONY: setup
setup:
	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install ansible
	ansible-galaxy collection install community.general

setup_ubuntu:
	sudo apt update
	sudo apt install software-properties-common
	sudo add-apt-repository --yes --update ppa:ansible/ansible
	sudo apt install ansible
	ansible-galaxy collection install community.general


