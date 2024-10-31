vim.o.showtabline = 2

require('tabby').setup({
  preset = 'active_wins_at_tail',
  option = {
    theme = {
      fill = 'TabLineFill',       -- tabline background
      head = 'TabLine',           -- head element highlight
      current_tab = 'TabLineSel', -- current tab label highlight
      tab = 'TabLine',            -- other tab label highlight
      win = 'TabLine',            -- window highlight
      tail = 'TabLine',           -- tail element highlight
    },
    nerdfont = true,              -- whether use nerdfont
    lualine_theme = nil,          -- lualine theme name
    tab_name = {
      name_fallback = function(tabid)
        return tabid
      end,
    },
    buf_name = {
      mode = "unique",
    },
  },
})

