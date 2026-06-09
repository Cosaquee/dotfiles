{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Homebrew — declaratively managed via brew bundle
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap"; # remove unlisted packages
      autoUpdate = true;
      upgrade = true;
      # Homebrew 5.x requires an explicit confirmation flag for `brew bundle --cleanup`.
      extraFlags = [ "--force-cleanup" ];
    };

    taps = [
      "withgraphite/tap"
      "asheshgoplani/tap"
    ];

    brews = [
      "withgraphite/tap/graphite"
      "asheshgoplani/tap/agent-deck"
    ];

    casks = [
      # Add casks here, e.g. "firefox"
    ];
  };

  # Declare the user so home-manager can resolve the home directory
  users.users.karolkozakowski = {
    name = "karolkozakowski";
    home = "/Users/karolkozakowski";
  };

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Required for nix-darwin
  system.primaryUser = "karolkozakowski";
  system.stateVersion = 6;
}
