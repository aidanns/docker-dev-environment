FROM ubuntu:20.04

LABEL maintainer="Aidan Nagorcka-Smith <aidanns@gmail.com>"

# See https://systemd.io/CONTAINER_INTERFACE/ for what systemd wants so that
# it can run in a container.

ENV container docker

STOPSIGNAL SIGRTMIN+3

# /bin/sh is the default.
SHELL [ "/bin/bash", "-c" ]

# References:
#   https://github.com/coder/enterprise-images/blob/main/images/vnc/Dockerfile.ubuntu
#   https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04

# Install baseline packages.
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" DEBCONF_NONINTERACTIVE_SEEN=true \
    apt-get install --yes \
      bash \
      build-essential \
      ca-certificates \
      curl \
      # TODO(aidanns): Switch to docker-engine direct from docker.
      docker.io \
      firefox \
      fonts-lyx \
      htop \
      inetutils-ping \
      libc6-dev \
      libglu1 \
      libglu1-mesa \
      libsm6 \
      libxtst6 \
      libxv1 \
      locales \
      man \
      net-tools \
      python-numpy \
      python3 \
      python3-pip \
      software-properties-common \
      ssh \
      sudo \
      supervisor \
      systemd \
      systemd-sysv \
      tightvncserver \
      unzip \
      vim \
      wget \
      x11-apps \
      x11-xkb-utils \
      xauth \
      xfce4 \
      xfce4-goodies \
      xfonts-base \
      xkb-data \
      xorg \
      xterm \
      zsh

# Install latest Git using their official PPA.
RUN add-apt-repository ppa:git-core/ppa && \
    DEBIAN_FRONTEND="noninteractive" DEBCONF_NONINTERACTIVE_SEEN=true \
    apt-get install --yes git

# Install quality of life packages.
RUN yes | unminimize

# Remove packages which may not behave well in a VNC environment.
RUN apt-get remove -y \
      xfce4-battery-plugin \
      xfce4-power-manager-plugins \
      xfce4-pulseaudio-plugin \
      light-locker

# Add a user `developer` so that you're not developing as the `root` user.
RUN useradd developer \
      --create-home \
      --shell=/bin/bash \
      --groups=docker \
      --uid=1000 \
      --user-group && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd && \
    echo "developer:developer" | chpasswd developer

COPY rootfs /
RUN chown -R developer:developer /home/developer && \
    chmod 700 /home/developer/.vnc/passwd

EXPOSE 5901
EXPOSE 22

ENTRYPOINT [ "/sbin/init" ]