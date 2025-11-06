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

  cinnamon = pkgs.vimUtils.buildVimPlugin {
    name = "cinnamon";
    src = pkgs.fetchFromGitHub {
      owner = "declancm";
      repo = "cinnamon.nvim";
      rev = "ecd211e46a1d4fb0efffbdb2c2bbd59785605870";
      sha256 = "sha256-+nDYk3zkLlj9YkzfK8mbD22iLWaHpzHImxPt3EVfyV0=";
    };
  };

  venv-selector = pkgs.vimUtils.buildVimPlugin {
    name = "venv-selector";
    src = pkgs.fetchFromGitHub {
      owner = "linux-cultist";
      repo = "venv-selector.nvim";
      rev = "9b1bfe5aea225853e14358f504c656d4af007035";
      sha256 = "sha256-XY4hHvslNginl+FxT7owjobInmyhRDwPtNaWOAPpOO0=";
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
        plenary-nvim

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
        twilight-nvim

        git-blame-nvim

        nvim-treesitter.withAllGrammars
        nvim-treesitter-textsubjects

        # LSP
        #mason-nvim
        #mason-lspconfig-nvim

        nvim-lspconfig
        nvim-lsp-ts-utils

        none-ls-nvim

        # Debug adapter protocol
        nvim-dap
        telescope-dap-nvim
        nvim-dap-ui
        nvim-dap-virtual-text

        # theming
        nord-nvim
        tokyonight-nvim
        neon
        nightfox-nvim
        oxocarbon-nvim
        everforest
        rose-pine

        copilot-vim
        toggleterm-nvim
        vimagit

        lsp_lines-nvim

        vim-floaterm
        sort-nvim
        trouble-nvim
        which-key-nvim
        noice-nvim

        bufferline-nvim
        barbar-nvim
        yazi-nvim

        scope
        cinnamon
        venv-selector

        neoscroll-nvim
        nvim-lightbulb
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
