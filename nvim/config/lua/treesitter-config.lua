-- Treesitter
require'nvim-treesitter.configs'.setup {
    highlight = {
	    enable = true
    },
    indent = {
        enable = true
    },
    autopairs = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil
    }
}
