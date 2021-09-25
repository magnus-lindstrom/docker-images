#!/bin/bash

set -e

build_rust_image() {
  set +e
  docker build \
    --build-arg uid=$UID --build-arg user=$USER \
    --build-arg home=/home/user --no-cache \
    --tag rust_general ./rust_general/
  build_status=$?
  set -e

  if [ "$build_status" -eq 0 ]; then
    echo
    echo "### BUILD SUCCESSFUL ###"
    echo
  else
    echo
    echo "### BUILD FAILED ###"
    echo
  fi
}

build_rust_webassembly() {
  set +e
  docker build \
    --build-arg uid=$UID --build-arg user=$USER \
    --build-arg home=/home/user \
    --tag rust_webassembly ./rust_webassembly/
  build_status=$?
  set -e

  if [ "$build_status" -eq 0 ]; then
    echo
    echo "### BUILD SUCCESSFUL ###"
    echo
  else
    echo
    echo "### BUILD FAILED ###"
    echo
  fi
}

setup() {
  echo "Setting up dotfiles.."
  cp ~/.bashrc "./rust_general/"
  cp ~/.gitconfig "./rust_general/"
  cp ~/.tmux.conf "./rust_general/"
}

teardown() {
  echo "Tearing down dotfiles.."
  rm "./rust_general/.bashrc"
  rm "./rust_general/.gitconfig"
  rm "./rust_general/.tmux.conf"
}

main() {
  setup
  # build_rust_webassembly
  build_rust_image
  teardown
}

main
