{ config, pkgs, lib, ... }:
with lib;
{
  config = {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      # Plugins are now managed by lazy.nvim (see lua/plugins/)
      plugins = [ ];

      extraPackages = with pkgs; [
        git # Required for lazy.nvim to clone plugins
        tree-sitter
        nodejs
        # Language Servers
        # Bash
        nodePackages.bash-language-server
        # Lua
        lua-language-server
        nixpkgs-fmt
        statix
        # Python
        pyright
        black
        # Terraform
        terraform-ls

        # Typescript
        nodePackages.typescript-language-server
        # Web (ESLint, HTML, CSS, JSON)
        nodePackages.vscode-langservers-extracted
        # Telescope tools
        ripgrep
        fd

      ];

      extraConfig = ''
        :luafile ~/.config/nvim/lua/init.lua

        set tabstop=2 "4 char-wide tab
        set expandtab "Use spaces
        set softtabstop=0 "Use same length as 'tabstop'
        set shiftwidth=0 "Use same length as 'tabstop'
      '';
    };

    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };
  };
}
