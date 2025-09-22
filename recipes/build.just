#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ░░░░ build
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set working-directory := ".."

[working-directory(".")]
macos-arm *args:
    @echo -e "Start running the script..."
    @echo -e "Start building the app for macos platform..."
    wails build --clean --platform darwin/arm64 {{ args }}
    @echo -e "End running the script!"

[working-directory(".")]
macos-intel *args:
    @echo -e "Start running the script..."
    @echo -e "Start building the app for macos platform..."
    wails build --clean --platform darwin {{ args }}
    @echo -e "End running the script!"

[working-directory(".")]
macos *args:
    @echo -e "Start running the script..."
    @echo -e "Start building the app for macos platform..."
    wails build --clean --platform darwin/universal {{ args }}
    @echo -e "End running the script!"

[working-directory(".")]
windows *args:
    @echo -e "Start running the script..."
    @echo -e "Start building the app for windows platform..."
    wails build --clean --platform windows/amd64 {{ args }}
    @echo -e "End running the script!"

[working-directory(".")]
default *args:
    @echo -e "Start running the script..."
    @echo -e "Start building the app..."
    wails build --clean {{ args }}
    @echo -e "End running the script!"

[working-directory("frontend")]
frontend *args:
    bun run build {{ args }}
