{ config, pkgs, ... }:

let
  pythonWithBoto3 = pkgs.python311.withPackages (ps: with ps; [
    boto3
  ]);
in {
  home.username = "atlas";
  home.homeDirectory = "/home/atlas";
  home.stateVersion = "24.11";

  # Import shared configuration (includes nvim)
  imports = [ ./modules/shared.nix ];

  # VPS-specific packages
  home.packages = with pkgs; [
    # Development tools
    rustup
    openssl
    uv
    pythonWithBoto3

    # Cloud and DevOps tools
    aws-vault
    awscli2
    kubectl
    kubectx
    kubernetes-helm
    terraform
    terraform-docs
    terragrunt
    k9s
    sops

    # Server utilities
    htop
    tmux
    vim
    curl
    wget

    # Additional development tools
    docker
    docker-compose
    nodejs_22
    yarn
  ];

  home.file = {
    # Create Terraform plugin cache directory
    ".terraform.d/plugin-cache/.keep".text = "";
  };

  home.sessionVariables = {
    # Add your VPS-specific session variables here
  };

  # VPS-specific shell configuration
  programs.zsh.shellAliases = {
    k = "kubectl";
    tf = "terraform";
    tg = "terragrunt";
  };

  programs.zsh.oh-my-zsh.plugins = [ "terraform" "kubectl" "fzf" ];

  programs.zsh.initExtra = ''
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    fi

    PATH=$HOME/.local/bin:$PATH

    # Terraform provider caching
    export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
  '';
}
