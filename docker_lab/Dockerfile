FROM almalinux:8

RUN dnf install -y yum-utils ncurses openssh-server \
  && dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
  && dnf install -y docker-ce-cli \
  && dnf clean all

RUN mkdir -p /var/run/sshd

CMD ["sleep","infinity"]

