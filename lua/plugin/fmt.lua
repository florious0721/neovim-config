return {
  'stevearc/conform.nvim',
  event = 'VeryLazy',
  config = function()
    local conform = require('conform')
    conform.setup({
    formatters = {uncrustify = {command = 'uncrustify'}},
    formatters_by_ft = {c = {'uncrustify'}, cpp = {'uncrustify'}},
  })
    vim.keymap.set({'n', 'v'}, '<leader>f', function()
      conform.format({async = true, lsp_format = 'fallback'})
    end)
  end,

}
