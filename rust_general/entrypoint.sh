#!/bin/bash

set -e

if [ "$EUID" -eq 0 ]; then
  echo "running as root"
  # useradd --uid "${uid}" --home-dir "${home}" "${user}"

  # make everything mine
  # pushd "$home" > /dev/null
  # chown -R "${user}":"${user}" .
  # popd > /dev/null

  # su "${user}" -c bash
else
  echo "running as me"
  # bash $@
fi
