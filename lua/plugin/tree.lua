return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup({
      diagnostics = {
        enable = true,
        icons = {
          hint = 'H',
          info = 'I',
          warning = 'W',
          error = 'E',
        },
        show_on_dirs = true,
      },
      renderer = {icons = {
        glyphs = {
          folder = {
            arrow_closed = '-',
            arrow_open = '|'
          },
          git = {
            deleted = '[X]',
            ignored = '[.]',
            renamed = '[>]',
            staged = '[S]',
            unmerged = '[U]',
            unstaged = '[M]',
            untracked = '[N]',
          },
        },
        padding = {icon = ''},
        show = {
          file = false,
          folder = false,
          folder_arrow = true,
          hidden = false,
        },
      }}
    })
    vim.keymap.set({'n'}, '<leader>q', require('nvim-tree.api').tree.toggle)
  end,
}
