{ config, pkgs, nix-vscode-extensions, ... }:

{
  home.username = "karolkozakowski";
  home.homeDirectory = "/Users/karolkozakowski";

  home.stateVersion = "23.11"; # Please read the comment before changing.

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

    pkgs.ack
    pkgs.aws-vault
    pkgs.aws-vault
    pkgs.awscli2
    pkgs.bat
    pkgs.cw
    pkgs.detect-secrets
    pkgs.diff-so-fancy
    pkgs.direnv
    pkgs.discord
    pkgs.d2
    pkgs.docker
    pkgs.docker-compose
    pkgs.eksctl
    pkgs.exa
    pkgs.fzf
    pkgs.go
    pkgs.ghorg
    pkgs.git-lfs
    pkgs.gitleaks
    pkgs.jq
    pkgs.k9s
    pkgs.kubectx
    pkgs.kubernetes-helm
    pkgs.kustomize
    pkgs.lazygit
    pkgs.lsd
    pkgs.minikube
    pkgs.nixfmt
    pkgs.nodejs_18
    pkgs.openssh
    pkgs.pre-commit
    pkgs.slack
    pkgs.sops
    pkgs.terraform
    pkgs.terraform-docs
    pkgs.terraform-ls
    pkgs.tflint
    pkgs.tree
    pkgs.yarn
    pkgs.yq
    pkgs.zellij
    pkgs.zoxide
    pkgs.gh
    pkgs.vscode
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
      c = "cd /Volumes/Code";
    };
    oh-my-zsh = {
      enable = true;
      theme = "simple";
      plugins = [ "terraform" "kubectl" "fzf" ];
    };
  };

  programs.zoxide.enable = true;

  programs.starship.enable = true;

  programs.starship.settings = {
    # See docs here: https://starship.rs/config/
    # Symbols config configured ./starship-symbols.nix.

    directory.fish_style_pwd_dir_length = 0; # turn on fish directory truncation
    gcloud.disabled = true; # annoying to always have on
    add_newline = false;

    aws = {
      format = "[$symbol($profile )(($region) )([$duration] )]($style)";
      symbol = "🅰 ";
      style = "bold yellow";
      disabled = false;
      expiration_symbol = "X";
      force_display = false;
    };
  };

  programs.zsh.initExtra = "if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi";

  programs.vscode = {
    enable = true;

    userSettings = {
      "editor.minimap.enabled" = true;
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
      "workbench.iconTheme" = "vs-seti";
    };

    extensions = with pkgs.vscode-extensions; [
      arcticicestudio.nord-visual-studio-code
      github.copilot
      golang.go
      hashicorp.terraform
      ms-python.python
      pkief.material-icon-theme
      pkief.material-product-icons
      roman.ayu-next
      vscodevim.vim
    ];
  };
}
