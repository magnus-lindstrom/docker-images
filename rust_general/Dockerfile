FROM rust:1.55

ARG uid
ARG gid
ARG user
ARG home
ENV uid=$uid
ENV gid=$gid
ENV user=$user
ENV home=$home

RUN groupadd --gid "$gid" "$user"
RUN useradd --home-dir "$home" --uid "$uid" --gid "$gid" "$user"

COPY ./.bashrc "${home}/"
COPY ./.gitconfig "${home}/"
COPY ./.tmux.conf "${home}/"
RUN chown -R "$user":"$user" "$home"

# some packages require interaction in apt update + upgrade
# ENV DEBIAN_FRONTEND=noninteractive

### General config
RUN apt update && yes | apt upgrade && yes | apt install \
    build-essential \
    curl \
    less \
    libssl-dev \
    pkg-config \
    sudo \
    tmux \
    tree \
    vim

USER "$user"
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | bash

ENTRYPOINT bash
