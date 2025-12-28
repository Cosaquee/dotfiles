{ config, pkgs, nix-vscode-extensions, ... }:

let
  pythonWithBoto3 = pkgs.python311.withPackages (ps: with ps; [
    boto3
  ]);
in {
  home.username = "karolkozakowski";
  home.homeDirectory = "/Users/karolkozakowski";
  home.stateVersion = "24.11";

  # Import shared configuration (includes nvim and common packages)
  imports = [ ./modules/shared.nix ];

  # macOS-specific packages
  home.packages = with pkgs; [
    # Development tools
    pythonWithBoto3
    moon
    rustup
    openssl
    uv
    claude-code
    chatgpt
    opencommit

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
    aws-assume-role
    mkcert

    # Additional system utilities (beyond shared)
    sops

    # Productivity and communication
    discord
    slack
    zoom-us
    hledger
    hledger-ui
    hledger-utils

    # Other tools
    docker
    docker-compose
    cloc
    opam
    devenv
    proto

    # Terminal and editor settings
    yaml-language-server
    nodePackages.typescript
    nodejs_22
    yarn

    # macOS-specific utilities
    gnupg1
    pinentry_mac
    yubico-piv-tool
    _1password-cli
    puffin
  ];

  home.file = {
    # Create Terraform plugin cache directory
    ".terraform.d/plugin-cache/.keep".text = "";

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

  # macOS-specific shell configuration
  programs.zsh = {
    shellAliases = {
      c = "cd /Volumes/Code";
      k = "kubectl";
      tf = "terraform";
      tg = "terragrunt";
    };

    oh-my-zsh.plugins = [ "terraform" "kubectl" "fzf" ];

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

  programs.zsh.initExtra = ''

    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi

    PATH=/Users/karolkozakowski/.local/bin:$PATH

    # Terraform provider caching
    export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent

    eval "$(proto activate zsh)"
  '';
}
