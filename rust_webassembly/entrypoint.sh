#!/bin/bash

set -e

if [ "$EUID" -eq 0 ]; then
  echo "not running as root, beep boop"

  useradd --uid "${UID}" --home-dir /home/user "${USER}"
  exec su "${USER}" -c "/bin/bash $@"
else
  exec bash $@
fi
