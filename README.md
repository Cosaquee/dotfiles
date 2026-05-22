# home-manager

My Nix configuration for macOS (nix-darwin + home-manager) and a Linux VPS profile.

## What's in here

- `flake.nix` — entry point; defines the `karolkozakowski` darwin profile and the `karolkozakowski-vps` Linux profile
- `darwin.nix` — macOS system config (Homebrew taps/casks, nix-darwin settings)
- `home.nix` — macOS user packages and shell config
- `home-vps.nix` — Linux VPS user packages and shell config
- `modules/shared.nix` — packages and zsh config shared by both profiles
- `nvim/` — Neovim configuration
- `Makefile` — `switch`, `update`, `check`, `gc`, etc.

## Setup on a fresh macOS laptop

Assumes Apple Silicon (`aarch64-darwin`).

### 1. Install Nix

Use the Determinate Systems installer (handles flakes + uninstall cleanly):

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Open a new shell so `nix` is on `PATH`.

### 2. Clone this repo

The flake must live at `~/.config/home-manager` (the Makefile and aliases assume that path):

```sh
mkdir -p ~/.config
git clone <this-repo-url> ~/.config/home-manager
cd ~/.config/home-manager
```

### 3. Adjust for your user (if you're not me)

The username `karolkozakowski` is hardcoded. If your macOS user is different, search-and-replace it in:

- `flake.nix` — `darwinConfigurations."karolkozakowski"` and `home-manager.users.karolkozakowski`
- `darwin.nix` — `users.users.karolkozakowski` and `system.primaryUser`
- `home.nix` — `home.username`, `home.homeDirectory`, and the `PATH` line in `initContent`
- `Makefile` — `PROFILE := karolkozakowski`

### 4. Bootstrap nix-darwin

There's no `darwin-rebuild` yet, so run it via `nix`:

```sh
sudo nix run nix-darwin -- switch --flake .#karolkozakowski
```

After this completes, `/run/current-system/sw/bin/darwin-rebuild` exists and the Makefile takes over.

### 5. Day-to-day

```sh
make switch         # apply current config
make update         # update flake inputs, then switch
make check          # build without activating
make gc             # garbage-collect old generations (>7 days)
```

The shared zsh config also exposes these as aliases: `switch`, `update`, `clean`, `homemanager`.

## Setup on the Linux VPS

```sh
nix run home-manager/master -- switch --flake .#karolkozakowski-vps
```

After that, `make switch` works the same way (it detects Linux via `uname`).

## Notes

- `nixpkgs` tracks `nixpkgs-unstable`.
- `homebrew.onActivation.cleanup = "zap"` — Homebrew packages not listed in `darwin.nix` will be removed on switch. Add casks/brews there, not via `brew install` directly.
- `allowUnfree = true` is set so things like `claude-code` and `_1password-cli` build.
- The MCP module comes from the `mcps` flake input (`github:roman/mcps.nix`).
