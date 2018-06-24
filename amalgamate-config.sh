#!/bin/bash
#
# "Include" keyword of ssh config file is supported by OpenSSH 7.3 or higher.
# Use with lower OpenSSH, you amalgamate config.d files.
# To check OpenSSH version, run below command.
#
#   $ ssh -V
#
# If you need amalgamate config.d files, use this script like below.
#
#   $ bash ./amalgamate.sh > ~/.ssh/config
#

function main() {
  local files=$(ls config.d/*)

  for file in ${files}; do
    echo '#---------------------------------------'
    echo "# ${file}"
    echo '#---------------------------------------'
    cat ${file}
    echo
  done
}

main "$@"
