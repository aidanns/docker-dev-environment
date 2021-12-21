FROM ubuntu:20.04

LABEL maintainer="Aidan Nagorcka-Smith <aidanns@gmail.com>"

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

ENV container docker

STOPSIGNAL SIGRTMIN+3

ENTRYPOINT [ "/sbin/init" ]
