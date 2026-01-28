FROM almalinux:9

RUN dnf -y update && \
  dnf -y install epel-release && \
  dnf -y install \
  ansible-core \
  dnf-utils \
  device-mapper-persistent-data \
  lvm2 \
  curl-minimal \
  ca-certificates \
  iproute \
  iputils \
  procps-ng \
  vim \
  git \
  sudo \
  openssh-clients \
  python3 \
  python3-pip && \
  dnf clean all

RUN dnf config-manager --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

RUN dnf -y install docker-ce-cli && \
  dnf clean all

RUN mkdir -p /tmp/.ansible/tmp && chmod -R 777 /tmp/.ansible

RUN ansible-galaxy collection install community.mysql

CMD ["tail", "-f", "/dev/null"]
