FROM alpine:3.14

### configure docker user and swap to that user
ENV USER=magnus
ENV UID=12345
ENV GID=23456

ARG HOME_DIR="/mnt/home/$USER"
RUN mkdir -p "$HOME_DIR"

RUN addgroup \
    -S "$USER"
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$HOME_DIR" \
    --ingroup "$USER" \
    --uid "$UID" \
    "$USER"

### Installations
RUN yes | apk add bash
# RUN yes | apk add build-essentials
RUN yes | apk add curl
RUN yes | apk add git
RUN yes | apk add libgcc
# RUN yes | apk add pkg-config
RUN yes | apk add sudo
RUN yes | apk add tmux
RUN yes | apk add tree
RUN yes | apk add vim

### Run rest of commands as user
USER "$USER"

COPY --chown="$USER" ./.bashrc "$HOME_DIR/"
COPY --chown="$USER" ./.gitconfig "$HOME_DIR/"
COPY --chown="$USER" ./.tmux.conf "$HOME_DIR/"

### Install Rust
# rust install won't work without below env
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="$PATH:${HOME_DIR}/.cargo/bin/"
WORKDIR /tmp/
RUN curl https://sh.rustup.rs -sSf > ./rust_install
RUN chmod 755 ./rust_install
RUN ./rust_install -y
RUN rm ./rust_install

WORKDIR "$HOME_DIR"
