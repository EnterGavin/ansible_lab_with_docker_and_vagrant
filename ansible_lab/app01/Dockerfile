FROM almalinux:9

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Atualiza e instala pacotes básicos
RUN dnf -y update && \
  dnf -y install epel-release && \
  dnf -y install \
  python3 \
  python3-pip \
  openssh-server \
  openssh-clients \
  sudo \
  vim \
  git \
  passwd && \
  dnf clean all

# Cria usuário padrão "app" e define senha
RUN useradd -m app && \
  echo "app:12345" | chpasswd && \
  echo "app ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Configura root também com senha
RUN echo "root:12345" | chpasswd && \
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Inicializa chave do SSH e diretórios
RUN ssh-keygen -A && \
  mkdir -p /var/run/sshd

# Expõe portas
EXPOSE 22 8080

# Mantém container vivo com SSH ativo
CMD ["/usr/sbin/sshd", "-D"]
