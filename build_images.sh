#!/bin/bash

set -e

build_images() {
  set +e

  docker build ./rust_general/ --tag rust_general
  build_status=$?

  if [ "$build_status" -eq 0 ]; then
    echo
    echo "### BUILD SUCCESSFUL ###"
    echo
  else
    echo
    echo "### BUILD FAILED ###"
    echo
  fi

  return $build_status
}

setup() {
  echo "Setting up dotfiles.."
  cp ~/.bashrc ./rust_general/
  cp ~/.gitconfig ./rust_general/
  cp ~/.tmux.conf ./rust_general/
}

teardown() {
  echo "Tearing down dotfiles.."
  rm ./rust_general/.bashrc
  rm ./rust_general/.gitconfig
  rm ./rust_general/.tmux.conf
}

main() {
  setup
  build_images
  teardown
}

main
