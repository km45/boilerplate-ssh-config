#!/bin/bash

function generate() {
  local private_key_file_path=$1
  local comment=$2

  # not overwrite existed key
  echo 'n' | ssh-keygen \
    -t rsa -b 4096 -N "" \
    -C "${comment}" \
    -f "${private_key_file_path}" \
    > /dev/null
}

function invoke() {
  local key_file_name=$1
  local remote_account_identifier=$2

  local user_name=$(whoami)
  local host_name=${HOSTNAME}
  local home_dir=${HOME}

  local private_key_file_path="${home_dir}/.ssh/${key_file_name}"
  local public_key_file_path="${private_key_file_path}.pub"
  local key_file_comment=(
    "${remote_account_identifier} from ${user_name}@${host_name}"
  )

  generate "${private_key_file_path}" "${key_file_comment}"
  echo "${public_key_file_path}"
}

function main() {
  # Call invoke() here.
  # You can call invoke() one more times.
  invoke 'id_rsa_km45_github' 'km45@github.com'  # example
}

main "$@"
