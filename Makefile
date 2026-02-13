# Nix configuration — common commands
# Run from ~/.config/home-manager

# Detect which config to use based on hostname/OS
UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
  PROFILE := karolkozakowski
else
  PROFILE := karolkozakowski-vps
endif

## Apply the current configuration
switch:
ifeq ($(UNAME),Darwin)
	sudo /run/current-system/sw/bin/darwin-rebuild switch --flake .#$(PROFILE)
else
	home-manager switch --flake .#$(PROFILE)
endif

## Update flake inputs (nixpkgs, home-manager, etc.) then rebuild
update:
ifeq ($(UNAME),Darwin)
	nix flake update
	sudo /run/current-system/sw/bin/darwin-rebuild switch --flake .#$(PROFILE)
else
	nix flake update
	home-manager switch --flake .#$(PROFILE)
endif

## Update a single flake input, e.g. make update-input INPUT=nixpkgs
update-input:
ifeq ($(UNAME),Darwin)
	nix flake update $(INPUT)
	sudo /run/current-system/sw/bin/darwin-rebuild switch --flake .#$(PROFILE)
else
	nix flake update $(INPUT)
	home-manager switch --flake .#$(PROFILE)
endif

## Show what would change without applying
check:
ifeq ($(UNAME),Darwin)
	nix build .#darwinConfigurations.$(PROFILE).system && echo "Build OK"
else
	home-manager build --flake .#$(PROFILE) && echo "Build OK"
endif

## List flake inputs and their current revisions
inputs:
	nix flake metadata

## Garbage-collect old generations and the nix store
gc:
	home-manager expire-generations "-7 days"
	nix-collect-garbage --delete-older-than 7d

## List home-manager generations
generations:
	home-manager generations

## Format all nix files (requires nixfmt in PATH)
fmt:
	find . -name '*.nix' -exec nixfmt {} +

.PHONY: switch update update-input check inputs gc generations fmt
