.PHONY: run
run:
	ansible-playbook  bootstrap.yml

.PHONY: setup
setup:
	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install ansible
	ansible-galaxy collection install community.general

