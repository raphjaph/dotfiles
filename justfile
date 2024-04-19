all: formulae crates

formulae:
  brew bundle install --file=Brewfile

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

crates:
  rustup update
  rustup component add clippy
  rustup component add rustfmt
  rustup component add rust-analyzer
  cargo install cargo-audit
  cargo install cargo-check
  cargo install cargo-edit
  cargo install cargo-expand
  cargo install cargo-fuzz
  cargo install cargo-limit
  cargo install cargo-outdated
  cargo install cargo-sort
  cargo install cargo-tarpaulin
  cargo install cargo-udeps
  cargo install cargo-watch
  cargo install nvim-send
  cargo install stylua
