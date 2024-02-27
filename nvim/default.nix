{ config, pkgs, lib, ... }:
with lib;
{
  config =  {
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

        feline-nvim

        gitsigns-nvim
        indent-blankline-nvim
        nvim-autopairs
        telescope-nvim
        trouble-nvim
        legendary-nvim

        nvim-treesitter.withAllGrammars

        # LSP
        mason-nvim
        mason-lspconfig-nvim

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
       ];

      extraPackages = with pkgs; [
        tree-sitter
        nodejs
        # Language Servers
        # Bash
        nodePackages.bash-language-server
        # Lua
        lua-language-server
        # Nix
        rnix-lsp
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
        let g:elixir_ls_home = "${pkgs.beam.packages.erlang.elixir-ls}"
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
