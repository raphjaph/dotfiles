all: rustup formulae crates home-manager

crates:
  cargo install cargo-audit
  cargo install cargo-check
  cargo install cargo-clippy
  cargo install cargo-edit
  cargo install cargo-expand
  cargo install cargo-fmt
  cargo install cargo-fuzz
  cargo install cargo-limit
  cargo install cargo-sort
  cargo install cargo-tarpaulin
  cargo install cargo-udeps
  cargo install cargo-watch
  cargo install stylua

formulae:
  brew bundle install --file=~/Brewfile

home-manager:
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager
  nix-channel --update
  export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
  nix-shell '<home-manager>' -A install

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
