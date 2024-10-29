# Makefile for running Ansible site playbook

# Variables
ANSIBLE_PLAYBOOK = ./run-ansible.sh
PLAYBOOK = site.yml

# Default target
.PHONY: all
all: run-playbook

# Target to install dependencies
.PHONY: install-deps
install-deps:
	pip install ansible ansible-lint

# Target to run the Ansible playbook for all hosts
.PHONY: run-playbook
run-playbook:
	$(ANSIBLE_PLAYBOOK) $(PLAYBOOK)

# Target to run the playbook for staging environment only
.PHONY: pixel_labs
pixel_labs:
	$(ANSIBLE_PLAYBOOK) $(PLAYBOOK) --limit pixel_labs

# Target to run the playbook with verbose output
.PHONY: run-playbook-verbose
run-playbook-verbose:
	$(ANSIBLE_PLAYBOOK) $(PLAYBOOK) -vvv

# Target to check the playbook syntax
.PHONY: syntax-check
syntax-check:
	$(ANSIBLE_PLAYBOOK) $(PLAYBOOK) --syntax-check

# Target to run ansible-lint
.PHONY: lint
lint:
	ansible-lint $(PLAYBOOK)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  install-deps         : Install Ansible and Ansible Lint"
	@echo "  run-playbook         : Run the Ansible site playbook for all hosts"
	@echo "  pixel_labs           : Run the playbook for pixel_labs environment only"
	@echo "  run-playbook-verbose : Run the playbook with verbose output"
	@echo "  syntax-check         : Check the playbook syntax"
	@echo "  lint                 : Run ansible-lint on the playbook"
	@echo "  help                 : Show this help message"