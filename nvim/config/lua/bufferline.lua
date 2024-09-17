-- Ensure 'termguicolors' is enabled for proper bufferline colors
vim.opt.termguicolors = true

-- Set up bufferline with additional configuration
require("bufferline").setup {
  options = {
    numbers = "none", -- Can be "ordinal", "buffer_id", etc.
    close_command = "bdelete! %d", -- Close buffer command
    right_mouse_command = "bdelete! %d", -- Right-click buffer close
    left_mouse_command = "buffer %d", -- Left-click to switch buffers
    middle_mouse_command = nil, -- Disable middle mouse close
    indicator = {
      style = 'icon',
      icon = '▎', -- Custom separator icon
    },
    buffer_close_icon = '', -- Icon for buffer close button
    modified_icon = '●', -- Icon for modified buffers
    close_icon = '', -- Close icon for bufferline
    left_trunc_marker = '', -- Marker when buffers are truncated on the left
    right_trunc_marker = '', -- Marker for buffers truncated on the right
    max_name_length = 18, -- Maximum buffer name length
    max_prefix_length = 15, -- Prefix used when buffer name is shortened
    tab_size = 18,
    diagnostics = "nvim_lsp", -- Show LSP diagnostics in bufferline
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      }
    },
    show_buffer_icons = true, -- Show filetype icons
    show_buffer_close_icons = true, -- Show buffer close icons
    show_close_icon = true, -- Show the close icon
    separator_style = "slant", -- Can​⬤
