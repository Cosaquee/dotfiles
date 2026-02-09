{ config, pkgs, ... }:

{
  # Import nvim configuration
  imports = [ ../nvim ];

  # Shared packages across all systems
  home.packages = with pkgs; [
    # Development tools
    git-lfs
    gitleaks
    pre-commit

    # System utilities
    bat
    eza
    fzf
    direnv
    lsd
    openssh
    jq
    yq
    zellij
    zoxide
    shellcheck
    tree
    httpie
    delta

    # Terminal utilities
    ack
    yazi
  ];

  programs = {
    bat.enable = true;
    eza.enable = true;  # replaces deprecated exa
  };

  programs.zoxide.enable = true;

  programs.lazygit = {
    enable = true;
  };

  programs.zsh.enable = true;

  programs.zsh = {
    shellAliases = {
      g = "lazygit";
      gs = "git status";
      ru = "cd $(git rev-parse --show-toplevel)";
      gc = "git checkout -";
      gp = "git pull";
      update = "nix-channel --update && nix-env -u";
      clean = "nix-collect-garbage";
      pip = "pip3";
      homemanager = "cd && cd .config/home-manager";
    };

    oh-my-zsh = {
      enable = true;
      theme = "simple";
      plugins = [ "fzf" ];
    };
  };

  programs.home-manager.enable = true;
}
