FROM ubuntu:20.04

ENV HOME="/mnt/home/"
ENV PATH="$PATH:/root/.cargo/bin/"
# rust install won't work without below env
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update 
RUN yes | apt install \
    build-essential \
    curl \
    git-all \
    libssl-dev \
    pkg-config \
    tmux \
    tree \
    vim

# RUN cp "./.vimrc" "~/.vimrc"
COPY ./.bashrc ~/
COPY ./.gitconfig ~/

WORKDIR /tmp/
RUN curl https://sh.rustup.rs -sSf > ./rust_install
RUN chmod 755 ./rust_install
RUN ./rust_install -y
