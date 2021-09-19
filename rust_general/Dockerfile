FROM ubuntu:20.04

### General config
# some packages require interaction in apt update + upgrade
ENV DEBIAN_FRONTEND=noninteractive

### configure docker user and swap to that user
ENV USER=magnus
ARG GROUP="$USER"
ENV UID=12345
# ENV GID=23456
RUN adduser --uid "$UID" "$USER"

### Installations
# RUN yes | apt install build-essentials
RUN apt update && yes | apt upgrade && yes | apt install \
    bash \
    build-essential \
    curl \
    git-all \
    libssl-dev \
    # pkg-config \
    sudo \
    tmux \
    tree \
    vim

### Run rest of commands as user
USER "$USER"

COPY --chown="$USER" ./.bashrc "$HOME_DIR/"
COPY --chown="$USER" ./.gitconfig "$HOME_DIR/"
COPY --chown="$USER" ./.tmux.conf "$HOME_DIR/"

### Install Rust
ENV PATH="${PATH}:/home/${USER}/.cargo/bin/"
WORKDIR /tmp/
RUN curl https://sh.rustup.rs -sSf > ./rust_install && \
    chmod 755 ./rust_install && \
    ./rust_install -y && \
    rm ./rust_install

RUN cargo install wasm-pack
