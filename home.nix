{ config, pkgs, nix-vscode-extensions, ... }:

let
  pythonWithBoto3 = pkgs.python311.withPackages (ps: with ps; [
    boto3
  ]);
in {
  home.username = "karolkozakowski";
  home.homeDirectory = "/Users/karolkozakowski";
  home.stateVersion = "24.11";
  imports = [ ./nvim ];

  home.packages = with pkgs; [
    # Development tools
    go
    git-lfs
    gitleaks
    pre-commit
    ruby
    rubyPackages.rails
    pythonWithBoto3
    moon
    rustup
    openssl
    uv
    sbcl
    claude-code

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
    terragrunt
    k9s
    auth0-cli

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
    delta

    # Productivity and communication
    discord
    slack
    zoom-us
    jrnl
    hledger
    hledger-ui
    hledger-utils
    spotify

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
    _1password-cli
    puffin
  ];

  home.file = {
    # Example file management
    # ".screenrc".source = dotfiles/screenrc;
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # Add your session variables here if needed
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
      pip = "pip3";
      homemanager = "cd && cd .config/home-manager";
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

  programs.lazygit = {
    enable = true;
  };

  programs.zsh.initExtra = ''

    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi

    PATH=/Users/karolkozakowski/.local/bin:$PATH
    TG_PROVIDER_CACHE=1

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

      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "Monolisa";
      "terminal.integrated.fontFamily" = "BerkleyMono";

      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = "on";
      "editor.smoothScrolling" = true;

      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      "json.format.keepLines" = true;

      "javascript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces" = false;
      "typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces" = false;

      "[json]" = {
        "editor.insertSpaces" = false;
        "editor.tabSize" = 2;
      };

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

    extensions = import ./vscode-extensions.nix {
      pkgs = pkgs;
      vscode-extensions = pkgs.vscode-extensions;
    };
  };
}
