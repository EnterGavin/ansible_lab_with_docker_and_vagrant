FROM almalinux:9

# Instala pacotes
RUN dnf -y install \
  mariadb-server \
  openssh-server \
  python3 \
  python3-pip \
  python3-setuptools \
  iproute \
  iputils \
  procps-ng \
  passwd \
  && dnf clean all

# Driver MySQL para Ansible
RUN pip3 install --no-cache-dir pymysql

# Preparar SSH
RUN ssh-keygen -A && \
  echo root:12345 | chpasswd && \
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Diretórios MariaDB
RUN mkdir -p /var/lib/mysql /var/run/mariadb && \
  chown -R mysql:mysql /var/lib/mysql /var/run/mariadb

EXPOSE 22 3306

# Subir SSH + MariaDB
CMD ["/bin/bash", "-c", "\
  if [ ! -d /var/lib/mysql/mysql ]; then \
  mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql; \
  fi && \
  /usr/sbin/sshd && \
  exec mariadbd --user=mysql --bind-address=0.0.0.0 \
  "]
