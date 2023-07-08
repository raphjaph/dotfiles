all: rustup formulae crates home-manager

crates:
  rustup update
  cargo install cargo-audit
  cargo install cargo-check
  rustup component add clippy
  cargo install cargo-edit
  cargo install cargo-expand
  rustup component add rustfmt
  cargo install cargo-fuzz
  cargo install cargo-limit
  cargo install cargo-sort
  cargo install cargo-tarpaulin
  cargo install cargo-udeps
  cargo install cargo-watch
  cargo install stylua

formulae:
  brew bundle install --file=Brewfile

home-manager:
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
  nix-channel --update
  nix run home-manager/release-23.05 -- init --switch
  home-manager switch

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
