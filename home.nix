{ config, pkgs, ... }:

{
  home.username = "karolkozakowski";
  home.homeDirectory = "/Users/karolkozakowski";

  home.stateVersion = "22.11"; # Please read the comment before changing.

  imports = [ ./nvim ];

  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    pkgs.awscli2
    pkgs.fzf
    pkgs.bat
    pkgs.ack
    pkgs.exa
    pkgs.lazygit
    pkgs.sops
    pkgs.aws-vault
    pkgs.openssh
    pkgs.yarn
    pkgs.docker
    pkgs.docker-compose
    pkgs.tree
    pkgs.nixfmt
    pkgs.slack
    pkgs.direnv
    pkgs.eksctl
    pkgs.aws-vault
    pkgs.git-lfs
    pkgs.lsd
    pkgs.detect-secrets
    pkgs.pre-commit
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/karolkozakowski/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  programs.zsh = {
    shellAliases = {
      g = "lazygit";
      gs = "git status";
      code = "cd /Volumes/Code";
    };
    oh-my-zsh = {
      enable = true;
      theme = "simple";
      plugins = [ "terraform" "kubectl" "fzf" ];
    };
    };

  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.minimap.enabled" = false;
      "editor.linkedEditing" = true;
      "editor.formatOnSave" = true;

      # font
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "Monolisa";
      "terminal.integrated.fontFamily" = "Monolisa";

      # smooth
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.smoothScrolling" = true;

      # bracket
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      # tree indent
      "workbench.tree.indent" = 15;

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";

      "workbench.colorTheme" = "Nord";
      "workbench.iconTheme" = "vs-minimal";
      };

      extensions = with pkgs.vscode-extensions; [
        pkief.material-product-icons
        pkief.material-icon-theme
        arcticicestudio.nord-visual-studio-code
        hashicorp.terraform
        vscodevim.vim
    ];
  };
}
