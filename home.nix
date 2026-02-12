{ config, pkgs, ... }:

let
  pythonWithBoto3 = pkgs.python311.withPackages (ps: with ps; [
    boto3
  ]);
in {
  home.username = "karolkozakowski";
  home.homeDirectory = "/Users/karolkozakowski";
  home.stateVersion = "25.11";
  home.enableNixpkgsReleaseCheck = false;

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
    fnm
    ks

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
    gh


    # Additional system utilities (beyond shared)
    sops

    # Productivity and communication
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

    aerospace

    # Terminal and editor settings
    yaml-language-server
    nodePackages.typescript
    nodejs_22
    yarn
    pnpm

    # macOS-specific utilities
    gnupg1
    pinentry_mac
    yubico-piv-tool
    _1password-cli
    puffin
  ];

  home.file = {
    # Add managed files here if needed
  };

  home.sessionVariables = { };

  ############################
  # PROGRAMS CONFIGURATION
  ############################

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;

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

    # MIGRATED: initExtra → initContent
    initContent = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      PATH=/Users/karolkozakowski/.local/bin:$PATH
      export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent

      eval "$(proto activate zsh)"
    '';
  };

  # Enable additional programs properly
  programs.bat.enable = true;
  programs.eza.enable = true;   # replaces deprecated exa
  programs.zoxide.enable = true;
  programs.lazygit.enable = true;
}
