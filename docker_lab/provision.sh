#!/bin/bash
set -euxo pipefail

dnf install -y yum-utils ncurses openssh-server

dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

dnf install -y docker-ce-cli

mkdir -p /var/run/sshd
/usr/sbin/sshd