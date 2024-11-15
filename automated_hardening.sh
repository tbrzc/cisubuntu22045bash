#!/usr/bin/env bash

# Enforce strict mode for bash scripting to catch errors early
set -euo pipefail


standalone_hardening_scripts() {
  source standalone/sshd.sh
}


main() {
    standalone_hardening_scripts
}


main