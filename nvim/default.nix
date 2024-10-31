{ config, pkgs, lib, ... }:
with lib;
let
  scope = pkgs.vimUtils.buildVimPlugin {
    name = "scope";
    src = pkgs.fetchFromGitHub {
      owner = "tiagovla";
      repo = "scope.nvim";
      rev = "932102696ead2b7ab9ff65017767b57e2722fdde";
      sha256 = "sha256-2eM+KXsF66ocdaV4zVHy8afgP1v+Gj85R3XBhmDORtU=";
    };
  };
in {
  config = {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        vim-sensible

        vim-nix

        nvim-web-devicons
        nvim-tree-lua

        #lualine-nvim
        #luatab-nvim

        #lualine-nvim
        vim-airline

        gitsigns-nvim
        indent-blankline-nvim
        nvim-autopairs
        telescope-nvim

        git-blame-nvim

        nvim-treesitter.withAllGrammars

        # LSP
        #mason-nvim
        #mason-lspconfig-nvim

        nvim-lspconfig
        nvim-lsp-ts-utils

        # Debug adapter protocol
        nvim-dap
        telescope-dap-nvim
        nvim-dap-ui
        nvim-dap-virtual-text

        # theming
        nord-nvim
        tokyonight-nvim

        copilot-vim
        toggleterm-nvim
        vimagit

        lsp_lines-nvim

        vim-floaterm
        sort-nvim
        trouble-nvim
        which-key-nvim

        tabby-nvim
        bufferline-nvim

        scope
      ];

      extraPackages = with pkgs; [
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

        # Typescript
        nodePackages.typescript-language-server
        # Web (ESLint, HTML, CSS, JSON)
        nodePackages.vscode-langservers-extracted
        # Telescope tools
        ripgrep
        fd

        # custom plugins
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
