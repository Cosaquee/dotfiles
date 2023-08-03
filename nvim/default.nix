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

        vim-elixir
        vim-nix
        kotlin-vim
        dart-vim-plugin
        vim-flutter

        nvim-web-devicons
        nvim-tree-lua

        feline-nvim

        gitsigns-nvim
        indent-blankline-nvim
        nvim-autopairs
        telescope-nvim
        trouble-nvim
        legendary-nvim
        dressing-nvim
        bufferline-nvim
        vim-smoothie
        numb-nvim
        leap-nvim
        nvim-ts-rainbow
        nvim-notify
        comment-nvim

        nvim-treesitter.withAllGrammars

        nvim-lspconfig
        nvim-lsp-ts-utils
        null-ls-nvim
        fidget-nvim
        nvim-lightbulb
        vim-illuminate

        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp-nvim-lsp-signature-help
        nvim-cmp
        lspkind-nvim

        # Snippets
        luasnip
        cmp_luasnip

        # Debug adapter protocol
        nvim-dap
        telescope-dap-nvim
        nvim-dap-ui
        nvim-dap-virtual-text

        # theming
        nord-nvim

        copilot-vim
      ];

      extraPackages = with pkgs; [
        tree-sitter
        nodejs
        # Language Servers
        # Bash
        nodePackages.bash-language-server
        # Dart
        dart
        # Elixir
        beam.packages.erlang.elixir-ls
        # Erlang
        beam.packages.erlang.erlang-ls
        # Kotlin
        kotlin-language-server
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

        set tabstop=4 "4 char-wide tab
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
