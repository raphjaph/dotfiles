{ config, pkgs, ... }:
let
  username = "raphael";
  home = "/Users/raphael";
in
{
  home = {
    username = username;
    homeDirectory = home;
    packages = with pkgs; [
      asciiquarium
      bat
      btop
      cmake
      fd
      ffmpeg
      fzf
      gh
      git
      gnupg
      go
      gopls
      helix
      htop
      isort
      jq
#      neovim
      nodePackages.typescript-language-server
      nodePackages_latest.prettier
      pdfgrep
      pfetch
      pipenv
      protobuf
      pstree
      python39Packages.grip
      qrencode
      reattach-to-user-namespace
      ripgrep
#      rustup
      silver-searcher
      skim
      socat
      sshfs
      sumneko-lua-language-server
      tldr
      tmux
      tor
      tree
      wget
      yapf
      zola
      zsh-completions
    ];
    sessionPath = [
      "$HOME/bin"
      "$HOME/go/bin"
      "$HOME/.cargo/bin"
      "/usr/local/bin"
      "/usr/local/sbin"
    ];
    stateVersion = "21.11";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    historySubstringSearch.enable = true;
    initExtra = ''
      PROMPT=$'\n%F{green}%m%f %B%F{cyan}%~%f%b\n> '
      
      eval "$(brew shellenv)"
      fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

      # share history between windows/panes
      setopt inc_append_history
      

      #if type brew &>/dev/null; then
      #  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
      #
      #  autoload -Uz compinit
      #  compinit
      #fi
      
      # set some env vars
      export EDITOR=nvim
      export VISUAL=nvim
      export HOMEBREW_NO_ANALYTICS=1 
      export HOMEBREW_NO_INSECURE_REDIRECT=1
      export HOMEBREW_CASK_OPTS=--require-sha
      
      # get nix working after macos update
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      # better vi mode in zsh
      #source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

      # fix backspace after normal mode 
      bindkey "^?" backward-delete-char

      # increase open file handle limit 
      ulimit -n 4096
    '';
    shellAliases = {
      ".."      = "cd ..";
      b         = "bat --style=plain";
      bcli      = "bitcoin-cli";
      bp        = "bat --style=plain --paging=always";
      c         = "clear";
      cdd       = "cd ~/dotfiles";
      dot       = "git --git-dir=$HOME/.dotfiles --work-tree=$HOME";
      ffd       = "cd $(fzf_directory)";
      ffe       = "fzf_edit";
      gaa       = "git add -u";
      gap       = "git add -p";
      gbr       = "git branch --sort=-committerdate";
      gcm       = "git commit --verbose";
      gcb       = "git checkout -b";
      gdf       = "git diff --name-only master | uniq | xargs $EDITOR";
      gpa       = "for remote in `git remote`; do git push $remote; done";
      gpf       = "git push --force-with-lease";
      gpum      = "git pull upstream master";
      gpom      = "git pull origin master";
      gs        = "git status";
      lg        = "lazygit";
      ghprc     = "gh pr checkout";
      hm        = "home-manager";
      http      = "python3 -m http.server -b 127.0.0.1 -d . 8888";
      h         = "hx";
      j         = "just --unstable";
      ja        = "just --unstable atlantis";
      jc        = "just --unstable --choose";
      jl        = "just --unstable --list";
      la        = "ls -laGh";# --color";
      ll        = "ls -lGh";# --color";
      ls        = "ls -G";# --color";
      lv        = "nvim -c \"normal '0\" -c bd1";
      man       = "colorful_man";
      o         = "open .";
      p         = "python -q";
      qr        = "qrencode -t ansiutf8";
      rap       = "return_and_pop.sh";
      sas       = "switch_and_stash.sh";
      s         = "source $HOME/.zshrc";
      sbcli     = "bitcoin-cli -chain=signet";
      sn        = "search_notes";
      tree      = "erd -H";
      tma       = "tmux attach-session";
      tmn       = "tmux new -s";
      tml       = "tmux list-sessions";
      unixt     = "date '+%s'";
      update    = "home-manager switch && source $HOME/.zshrc";
      vim       = "nvim";
      v         = "nvim";
      vims      = "cd ~/.config/nvim && nvim init.lua";
      veracrypt = "/Applications/VeraCrypt.app/Contents/MacOS/VeraCrypt --text";
    };
    defaultKeymap = "viins";
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --color=never --hidden";
    defaultOptions = [ "--height 75% --multi --reverse --bind ctrl-f:page-down,ctrl-b:page-up" ];
    fileWidgetCommand = "fd --type f --color=never --hidden";
    fileWidgetOptions = [ "--preview 'bat --color=always --line-range :500 {}'" ];
  };

#  programs.skim = {
#    enable = true;
#    enableZshIntegration = true;
#    defaultCommand = "fd --type f --color=never --hidden";
#    defaultOptions = [ "--height 75% --multi --reverse --bind ctrl-f:page-down,ctrl-b:page-up" ];
#    fileWidgetCommand = "fd --type f --color=never --hidden";
#    fileWidgetOptions = [ "--preview 'bat --color=always --line-range :500 {}'" ];
#  };

  programs.git = {
    enable = true;
    userName = "raphjaph";
    userEmail = "raphjaph@protonmail.com";
    delta.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
