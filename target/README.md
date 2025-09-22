# Target Directory

> The `target` directory is used to house all the build files and assets for your
> application.

The structure is:

* bin - Output directory
* darwin - macOS specific files
* windows - Windows specific files
* linux - Linux specific files

## Mac

The `darwin` directory holds files specific to Mac builds.
These may be customised and used as part of the build. To return these files to
the default state, simply delete them and build with `wails build`.

The directory contains the following files:

* `Info.plist` - the main plist file used for Mac builds. It is used when
building using `wails build`.
* `Info.dev.plist` - same as the main plist file but used when building using
`wails dev`.

## Windows

The `windows` directory contains the manifest and rc files used when building
with `wails build`. These may be customised for your application. To return
these files to the default state, simply delete them and build with `wails build`.

* `icon.ico` - The icon used for the application. This is used when building
using `wails build`. If you wish to use a different icon, simply replace this
file with your own. If it is missing, a new `icon.ico` file will be created
using the `appicon.png` file in the build directory.
* `installer/*` - The files used to create the Windows installer. These are used
when building using `wails build`.
* `info.json` - Application details used for Windows builds. The data here will
be used by the Windows installer, as well as the application itself (right click
the exe -> properties -> details)
* `wails.exe.manifest` - The main application manifest file.

## Linux

The `linux` directory holds files specific to Linux builds. These may be
customised for your application. To return these files to the default state,
simply delete them and build with `wails build`.

The directory contains the following files:

* `icon.png` - The icon used for the application. If you wish to use a
different icon, replace this file with your own. If it is missing, a new
`icon.png` will be created using the `appicon.png` file in the build directory.
* `desktop/*.desktop` - Desktop entry files used for Linux launchers. These
define how your application appears in menus and launchers.
* `appimage/*` - Files used to create an AppImage package for Linux builds.
