#!/bin/bash
PKGS_ROOT_PATH=$(dirname $(realpath -s $0))

# find . -maxdepth 1 ! -name ".*" ! -name "*.sh" -printf "\"%P\"\n" | sort
## python-pytest-runner
## python-ffmpeg-python
## Must be placed at top in that order
PKGS_ARRAY=(
    "python-pytest-runner"
    "python-ffmpeg-python"
    "alass"
    "anki-bin"
    "autocutsel"
    "bdf-unifont"
    "code-features"
    "code-marketplace"
    "colorz"
    "dmenu-nise"
    "dmenu-nise-git"
    "dragon-drop"
    "font-symbola"
    "hlib-git"
    "httpdirfs"
    "i3lock-color"
    "libwgpu-native"
    "overmix-git"
    "python-colorthief"
    "python-ffsubsync-venv"
    "python-haishoku"
    "python-pysubs2"
    "python-srt"
    "rxvt-unicode"
    "siji-ng"
    "simple-mtpfs"
    "transformers_ocr-nise"
    "transformers_ocr-nise-git"
    "ttf-monapo"
    "ttf-ms-win11-auto"
    "urxvt-resize-font-git"
    "vencord-installer-cli-bin"
    "xclip-git"
)

buildpkgs() {
    for pkg in "${PKGS_ARRAY[@]}"; do
        pkg_dir="$PKGS_ROOT_PATH/$pkg"
        echo "!!!!! Working on: $pkg_dir !!!!!"
        cd "$pkg_dir" 2> /dev/null
        makepkg -sc --noconfirm
    done
}

export MAKEFLAGS=-j12
if [ -n "$1" ]; then
    export PKGDEST="$(realpath $1)"
else
    export PKGDEST="$PKGS_ROOT_PATH/x86_64"
fi

buildpkgs
