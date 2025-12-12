return {
  'stevearc/conform.nvim',
  event = 'VeryLazy',
  config = function()
    local conform = require('conform')
    conform.setup({
    formatters = {uncrustify = {
      inherit = true,
      command = 'uncrustify',
      prepend_args = {
        '-c', vim.fn.stdpath('config')..'/toolcfg/uncrustify.cfg',
      },
    }},
    formatters_by_ft = {
      c = {'uncrustify'}, cpp = {'uncrustify'},
      cs = {'uncrustify'}, d = {'uncrustify'},
      java = {'uncrustify'}, vala = {'uncrustify'},
    },
  })
    vim.keymap.set({'n', 'v'}, '<leader>f', function()
      conform.format({async = true, lsp_format = 'fallback'})
    end)
  end,

}
