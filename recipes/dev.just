#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ░░░░ dev
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set working-directory := ".."

default: wails

[working-directory(".")]
wails:
    @just git init
    wails dev

[working-directory("frontend")]
frontend *args:
    @rm -rf ../build/
    @just git init
    bun run dev {{ args }}
