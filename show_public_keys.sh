#!/bin/bash

function show() {
  local public_key_file_path=$1

  echo '--------------------------------------------------------------------------------'
  echo 'Register below public key:'
  echo '--------------------------------------------------------------------------------'
  cat "${public_key_file_path}"
  echo
}

function main() {
  public_key_file_paths=''

  if [ -p /dev/stdin ]; then
    public_key_file_paths=$(cat -)
  else
    public_key_file_paths="$@"
  fi

  for public_key_file_path in ${public_key_file_paths}; do
    show ${public_key_file_path}
  done
}

main "$@"
