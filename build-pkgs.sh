#!/bin/bash
PKGS_ROOT_PATH=$(dirname $(realpath -s $0))

# find . -maxdepth 1 ! -name ".*" ! -name "*.sh" -printf "\"%P\"\n" | sort
PKGS_ARRAY=(
    "bdf-unifont"
    "dmenu-nise"
    "dmenu-nise-git"
    "font-symbola"
    "hlib-git"
    "libwgpu-native"
    "overmix-git"
    "rxvt-unicode-nise"
    "siji-ng"
    "transformers_ocr-nise"
    "transformers_ocr-nise-git"
    "ttf-monapo"
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
