#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ░░░░ git
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set working-directory := ".."

default: init

[working-directory(".")]
init:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ ! -d ".git" ]
    then echo ".git not found, initializing repository..."
      git init "."
      git -C "." add .
    fi
