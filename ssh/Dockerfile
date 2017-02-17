FROM rastasheep/ubuntu-sshd:14.04

RUN apt-get update && apt-get install -y \
    rsync \
 && rm -rf /var/lib/apt/lists/*

COPY init.sh init.sh
RUN bash init.sh
