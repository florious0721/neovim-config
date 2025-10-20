return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = {
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    options = {
      always_divide_middle = true,
      component_separators = '',
      icons_enabled = false,
      globalstatus = true,
      refresh = {
        statusline = 750,
        tabline = 750,
        winbar = 750,
      },
      section_separators = '',
      theme = 'onedark',
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'filename'},
      lualine_c = {{
        'diagnostics',
        always_visible = true,
        colored = true,
        sections = {'error', 'warn'},
        sources = {'nvim_lsp'},
        symbols = {error = 'E', warn = 'W'},
        update_in_insert = false,
      }},
      lualine_x = {'fileformat'},
      lualine_y = {'progress'},
      lualine_z = {{'location', padding = 0}},
    },
    tabline = {lualine_a = {'buffers'}},
  },
}
