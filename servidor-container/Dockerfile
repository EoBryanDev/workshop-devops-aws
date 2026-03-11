FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    sudo \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash bryan && \
    echo "bryan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Prepara o diretório SSH
RUN mkdir -p /home/bryan/.ssh && chown -R bryan:bryan /home/bryan/.ssh

USER bryan
WORKDIR /home/bryan