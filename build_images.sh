#!/bin/bash

set -e

# cp ~/.vimrc ./rust_general/
cp ~/.bashrc ./rust_general/
cp ~/.gitconfig ./rust_general/

docker build ./rust_general/ --tag rust_general 

# rm ./rust_general~/.vimrc
rm ./rust_general/.bashrc
rm ./rust_general/.gitconfig
