require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,

    hijack_directories   = {
        enable = true,
        auto_open = true,
    },

    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    diagnostics         = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },

    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },

    system_open = {
      cmd  = nil,
      args = {}
    },

    git = {
      enable = true
    },

    actions = {
        open_file = {
            resize_window = true
        }
    }
}
