FROM rust:1.31

ARG uid
ARG user
ARG home
ENV uid=$uid
ENV user=$user
ENV home=$home

COPY ./.bashrc "${home}/"
COPY ./.gitconfig "${home}/"
COPY ./.tmux.conf "${home}/"

COPY ./entrypoint.sh /
ENTRYPOINT /entrypoint.sh
