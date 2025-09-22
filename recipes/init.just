#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ░░░░ init
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set working-directory := ".."

default: git

[working-directory(".")]
git:
    @just git init

[working-directory("frontend")]
component *args:
    @bunx --bun shadcn@latest init {{ args }}
