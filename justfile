all:
  just rustup
  just formulae
  just crates

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

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
