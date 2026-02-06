# Dockerfile para app01
FROM almalinux:9

# Configurações de locale
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# --------------------------------------------------
# Atualiza e instala pacotes essenciais + Java/Maven/Git
# --------------------------------------------------
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
  java-17-openjdk \
  java-17-openjdk-devel \
  maven \
  passwd && \
  dnf clean all

# --------------------------------------------------
# Cria usuário 'app' e configura sudo sem senha
# --------------------------------------------------
RUN useradd -m app && \
  echo "app:12345" | chpasswd && \
  echo "app ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# --------------------------------------------------
# Configura root para login por senha via SSH
# --------------------------------------------------
RUN echo "root:12345" | chpasswd && \
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# --------------------------------------------------
# Inicializa chave SSH e diretórios necessários
# --------------------------------------------------
RUN ssh-keygen -A && \
  mkdir -p /var/run/sshd

# --------------------------------------------------
# Expõe portas
# 22 -> SSH
# 8080 -> Spring Boot
# --------------------------------------------------
EXPOSE 22 8080

# --------------------------------------------------
# Mantém container vivo com SSH ativo
# --------------------------------------------------
CMD ["/usr/sbin/sshd", "-D"]




