FROM ubuntu:20.04

# some packages require interaction in apt update + upgrade
ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=home

### Install Rust
RUN apt update && yes | apt upgrade && yes | apt install \
    build-essential \
    curl \
    libssl-dev\
    pkg-config
RUN curl https://sh.rustup.rs -Ssf > ./rust_install && \
    chmod 755 ./rust_install && \
    ./rust_install -y && \
    rm ./rust_install
RUN export PATH="$PATH:$HOME/.cargo/bin" && \
    cargo install wasm-pack

### General config
RUN apt update && yes | apt upgrade && yes | apt install \
    git-all \
    sudo \
    tmux \
    tree \
    vim
ARG HOME_DIR=/home/user
COPY ./.bashrc "${HOME_DIR}/"
COPY ./.gitconfig "${HOME_DIR}/"
COPY ./.tmux.conf "${HOME_DIR}/"

### User config
ENV UID=UID
ENV USER=USER

COPY ./entrypoint.sh /
ENTRYPOINT /entrypoint.sh
