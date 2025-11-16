return {
  'saghen/blink.cmp',
  opts = {
    appearance = {},
    completion = {
      accept = {auto_brackets = {enabled = false}},
      documentation = {auto_show = true, auto_show_delay_ms = 1000},
      ghost_text = {enabled = true},
      keyword = {range = 'prefix'},
      list = {selection = {preselect = false, auto_insert = true}},
      menu = {draw = {
        columns = {{'kind', 'label'}}
      }},
    },
    fuzzy = {implementation = 'prefer_rust'},
    keymap = {
      preset = 'none',
      ['<C-e>'] = {'cancel', 'fallback'},
      ['<C-j>'] = {'select_next', 'fallback'},
      ['<C-k>'] = {'select_prev', 'fallback'},
      ['<C-space>'] = {'accept', 'fallback'},
    },
  },
}
