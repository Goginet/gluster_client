FROM ubuntu:16.04

MAINTAINER Georgy Shapchits <gogi.soft.gm@gmail.com>

ENV USER root
ENV HOME=/root
ENV SRC_FILE ${HOME}/src/main.c
ENV BIN_FILE ${HOME}/bin/a.out

WORKDIR ${HOME}

ADD run.sh run.sh
ADD ssh .ssh

RUN apt update -y && \
    apt install -y apt-utils vim iputils-ping openssh-server build-essential mpich && \
    chmod +x run.sh

VOLUME /root/src
VOLUME /root/.ssh

ENTRYPOINT ["./run.sh"]