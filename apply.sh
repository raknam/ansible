#!/bin/bash

if [[ "$EUID" != 0 ]]; then
    sudo -k
    if sudo false; then
        echo "You must be sudo to continue"
        exit 1
    fi
fi

cd $(dirname ${BASH_SOURCE[0]})

sudo -E ANSIBLE_PYTHON_INTERPRETER=auto_silent \
  ansible-playbook --connection=local -i ../inventory.yml playbook.yml