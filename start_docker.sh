#!/bin/bash

usage() {
  echo """
Start a docker container from a prebuilt image.

Usage: start_docker [IMAGE]

Images to choose from:
  rust - A general purpose rust image.

Optional arguments:
  -h, --help   Display this message and exit.
"""
  exit $1
}
exit_with_msg() {
  echo "ERROR: $1"
  usage 1
}

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -h|--help) usage 0; shift ;;
    -*) usage 1; shift ;;
    *)  POSITIONAL+=("$1"); shift ;;
  esac
done

set -- "${POSITIONAL[@]}" # restore positional parameters

if [ "$#" -ne "1" ]; then
  exit_with_msg "Function takes exactly one positional argument."
fi

if [ "$1" = "rust_general" ]; then
  image_chosen="rust_general:latest"
  echo "Starting container from image ${image_chosen}"
  docker run -it \
    -v "$(pwd):/mnt/repo/" \
    -w "/mnt/repo/" \
    --net host \
    rust_general:latest \
    bash
else
  echo "No image specified."
fi
