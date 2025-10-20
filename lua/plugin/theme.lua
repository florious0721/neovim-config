return {
  'folke/tokyonight.nvim',
  event = 'VeryLazy',
  init = function()
    vim.cmd('colorscheme tokyonight')
  end,
  opts = {
    cache = true,
    style = 'night',
    styles = {},
    transparent = false,
    terminal_colors = false,
  },
}
