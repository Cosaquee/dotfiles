{ config, pkgs, nix-vscode-extensions, ... }: {
  home.username = "karolkozakowski";
  home.homeDirectory = "/Users/karolkozakowski";
  home.stateVersion = "24.05";
  imports = [ ./nvim ];
  home.packages = with pkgs; [
    ack
    asdf-vm
    aws-vault
    awscli2
    bat
    cw
    detect-secrets
    diff-so-fancy
    direnv
    discord
    d2
    docker
    docker-compose
    eksctl
    eza
    fzf
    go
    ghorg
    git-lfs
    gitleaks
    jq
    k9s
    kubectx
    kubernetes-helm
    kustomize
    lazygit
    lsd
    minikube
    nixfmt
    openssh
    pre-commit
    slack
    sops
    pandoc

    gnused
    cloc

    #terraform
    terraform-docs
    terraform-ls
    tflint

    tree
    yq
    zellij
    zoxide
    gh
    vscode
    yaml-language-server
    httpie

    python310Full

    zoom-us
    # Currently pretty old version
    # warp-terminal

    nodejs_20
    yarn
    moon

    gnupg1
    pinentry_mac
    yubico-piv-tool

    steampipe
    legitify

    alacritty
    alacritty-theme

    kubecm

    syft
    nodePackages.typescript
    moon

    ruby
    rubyPackages.rails

    shellcheck

    alacritty

    opam

    terragrunt
    driftctl

    yazi
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

  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  programs.zsh = {
    shellAliases = {
      g = "lazygit";
      gs = "git status";
      c = "cd /Volumes/Code";
      ru = "cd $(git rev-parse --show-toplevel)";
      gc = "git checkout - ";
      gp = "git pull";
    };
    oh-my-zsh = {
      enable = true;
      theme = "simple";
      plugins = [ "terraform" "kubectl" "fzf" ];
    };
    plugins = [{
      name = "zsh-kubectl-prompt";
      src = pkgs.fetchFromGitHub {
        owner = "superbrothers";
        repo = "zsh-kubectl-prompt";
        rev = "v1.1.0";
        sha256 = "sha256-9fdUGtdaiL/176UQhkJck99vcRIeeJ5utVuGa2WigDQ=";
      };
    }];
  };

  programs = {
    bat.enable = true;
    exa.enable = true;
  };

  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 16.0;
        normal = { family = "Berkeley Mono"; };
        };

      colors = rec {
        primary = {
          background = "#24283b";
          foreground = "#c0caf5";
        };

        normal = {
          black = "#1d202f";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#a9b1d6";
        };

        bright = {
          black = "#414868";
          red = "#f7768e";
          green = "#9ece6a";
          yellow = "#e0af68";
          blue = "#7aa2f7";
          magenta = "#bb9af7";
          cyan = "#7dcfff";
          white = "#c0caf5";
        };
      };
    };
  };

  programs.zoxide.enable = true;

  programs.zsh.initExtra = ''
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi

    PATH=/Users/karolkozakowski/.local/bin:$PATH

    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
  '';

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    userSettings = {
      "editor.minimap.enabled" = true;
      "editor.linkedEditing" = true;
      "editor.formatOnSave" = true;

      # font
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "Monolisa";
      "terminal.integrated.fontFamily" = "BerkleyMono";

      # smooth
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.smoothScrolling" = true;

      # bracket
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      "json.format.keepLines" = true;

      "javascript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces" =
        false;
      "typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces" =
        false;

      "[json]" = {
        "editor.insertSpaces" = false;
        "editor.tabSize" = 2;
      };

      # tree indent
      # "workbench.tree.indent" = 15;

      window.menuBarVisibility = "toggle";
      window.titleBarStyle = "custom";

      workbench.colorTheme = "Nord";
      workbench.iconTheme = "vs-seti";

      "explorer.confirmDelete" = false;
      "explorer.confirmDragAndDrop" = false;

      "files.autoSave" = "onFocusChange";
      "files.exclude"."**/.git" = true;
      "files.insertFinalNewline" = true;
      "files.trimTrailingWhitespace" = true;

      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };

      inlineSuggest.enabled = true;

      files = {
        eol = "\n";
        insertFinalNewline = true;
        trimTrailingWhitespace = true;
      };

      github.copilot.enable."*" = true;
      security.workspace.trust.enabled = false;

      keybindings = [
        {
          key = "cmd+0";
          command = "workbench.action.lastEditorInGroup";
        }
        {
          key = "cmd+1";
          command = "workbench.action.openEditorAtIndex1";
        }
        {
          key = "cmd+2";
          command = "workbench.action.openEditorAtIndex2";
        }
      ];

      "[javascript]" = {
        "editor.formatOnType" = true;
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.insertSpaces" = false;
      };
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
      tamasfe.even-better-toml
      prisma.prisma
    ];
  };

}
