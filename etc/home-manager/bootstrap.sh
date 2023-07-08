#!/bin/bash

https://nix-community.github.io/home-manager/index.html#ch-installation

# Install Nix
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume --daemon

# Install Home Manager
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --update

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-shell '<home-manager>' -A install

# Initiate Home Manager
home-manager switch && source "$HOME/.zshrc"


# Nix flakes
nix --extra-experimental-features "nix-command flakes" <sub-commands>
home-manager --extra-experimental-features "nix-command flakes" <sub-commands>
nix run home-manager/release-23.05 -- init --switch
home-manager switch
