FROM ubuntu:20.04

LABEL maintainer="Aidan Nagorcka-Smith <aidanns@gmail.com>"

# See https://systemd.io/CONTAINER_INTERFACE/ for what systemd wants so that
# it can run in a container.

ENV container docker

STOPSIGNAL SIGRTMIN+3

# /bin/sh is the default
SHELL [ "/bin/bash", "-c" ]

# Based on Coder enterprise images: https://github.com/cdr/enterprise-images/blob/main/images/base/Dockerfile.ubuntu

# Install baseline packages
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      bash \
      build-essential \
      ca-certificates \
      curl \
      # TODO(aidanns): Switch to docker-engine direct from docker
      docker.io \
      htop \
      locales \
      man \
      net-tools \
      ssh \
      python3 \
      python3-pip \
      software-properties-common \
      sudo \
      systemd \
      systemd-sysv \
      unzip \
      vim \
      wget && \
    # Install latest Git using their official PPA
    add-apt-repository ppa:git-core/ppa && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes git

# Add a user `developer` so that you're not developing as the `root` user
RUN useradd developer \
      --create-home \
      --shell=/bin/bash \
      --groups=docker \
      --uid=1000 \
      --user-group && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd && \
    echo "developer:developer" | chpasswd developer

COPY rootfs /

# References:
#   https://github.com/coder/enterprise-images/blob/main/images/vnc/Dockerfile.ubuntu
#   https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04

ARG DEBCONF_NONINTERACTIVE_SEEN=true
ARG DEBIAN_FRONTEND="noninteractive"
ARG ARCH=arm64

RUN echo 'tzdata tzdata/Areas select Etc' | debconf-set-selections; \
    echo 'tzdata tzdata/Zones/Etc select UTC' | debconf-set-selections

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    zsh \
    supervisor \
    xorg \
    ssh \
    xfce4 \
    xfce4-goodies \
    x11-apps \
    xterm \
    python-numpy \
    firefox \
    fonts-lyx \
    libxtst6 \
    libxv1 \
    libglu1-mesa \
    libc6-dev \
    libglu1 \
    libsm6 \
    libxv1 \
    x11-xkb-utils \
    xauth \
    xfonts-base \
    xkb-data \
    tightvncserver

# Install quality of life packages.
RUN yes | unminimize

# Remove packages which may not behave well in a VNC environment.
RUN apt-get remove -y \
  xfce4-battery-plugin \
  xfce4-power-manager-plugins \
  xfce4-pulseaudio-plugin \
  light-locker

RUN locale-gen en_US.UTF-8

EXPOSE 5901
EXPOSE 22

ENTRYPOINT [ "/sbin/init" ]
