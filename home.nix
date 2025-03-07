{ config, pkgs, nix-vscode-extensions, ... }: {
  home.username = "karolkozakowski";
  home.homeDirectory = "/Users/karolkozakowski";
  home.stateVersion = "24.05";
  imports = [ ./nvim ];

  home.packages = with pkgs; [
    # Development tools
    go
    git-lfs
    gitleaks
    pre-commit
    ruby
    rubyPackages.rails
    python311Full
    moon
    rustup
    openssl
    uv

    # Cloud and DevOps tools
    aws-vault
    awscli2
    eksctl
    kubectl
    kubectx
    kubernetes-helm
    kustomize
    minikube
    terraform
    terraform-docs
    terraform-ls
    tflint
    driftctl
    lazygit
    terragrunt
    k9s

    # System utilities
    bat
    eza
    fzf
    direnv
    lsd
    openssh
    sops
    jq
    yq
    zellij
    zoxide
    shellcheck
    tree
    httpie

    # Productivity and communication
    discord
    slack
    zoom-us

    # Other tools
    ack
    asdf-vm
    docker
    docker-compose
    steampipe
    legitify
    syft
    cloc
    opam
    devenv
    proto

    # Terminal and editor settings
    alacritty
    alacritty-theme
    vscode
    yaml-language-server
    nodePackages.typescript
    nodejs_20
    yarn
    yazi

    # Additional utilities
    gnupg1
    pinentry_mac
    yubico-piv-tool
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
      gc = "git checkout -";
      gp = "git pull";

      update = "nix-channel --update && nix-env -u";
      clean = "nix-collect-garbage";
      k = "kubectl";
      tf = "terraform";
      tg = "terragrunt";
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

  programs.zoxide.enable = true;

  programs.zsh.initExtra = ''

    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi

    PATH=/Users/karolkozakowski/.local/bin:$PATH

    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent

    eval "$(proto activate zsh)"
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

      files = {
        eol = "\n";
        insertFinalNewline = true;
        trimTrailingWhitespace = true;
      };

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

    extensions = import ./vscode-extensions.nix { pkgs = pkgs; vscode-extensions = pkgs.vscode-extensions; };
  };

}
