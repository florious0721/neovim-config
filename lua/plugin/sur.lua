return {
  'kylechui/nvim-surround',
  event = 'VeryLazy',
  opts = {
    aliases = {
      ['a'] = ')',
      ['b'] = ']',
      ['B'] = '}',
      ['d'] = "'",
      ['D'] = '"',
    },
    keymaps = {
      change = '<leader>sc',
      delete = '<leader>sd',
      normal = '<leader>sa',
    },
  },
}
