return {
  'ms-jpq/coq_nvim',
  branch = 'coq',
  event = 'VeryLazy',
  init = function()
    vim.g.coq_settings = {
      auto_start = true,
      ['clients.snippets.enabled'] = false,
      display = {
        ['ghost_text.context'] = {'<', '>'},
        ['icons.mode'] = 'none',
        ['preview.border'] = 'single',
        ['statusline.helo'] = false,
      },
      keymap = {
        bigger_preview = '<C-d>',
        manual_complete = '<C-x><C-u>',
        recommended = false,
      },
      xdg = true,
    }

    vim.api.nvim_set_keymap(
      'i', '<C-e>',
      [[pumvisible() ? "\<C-e>" : "\<Esc>"]],
      {expr = true, noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
      'i', '<Esc>',
      [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]],
      {expr = true, noremap = true, silent = true}
    )
    vim.api.nvim_set_keymap(
      'i', '<C-c>',
      [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]],
      { expr = true, noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      'i', '<BS>',
      [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]],
      { expr = true, noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      'i', '<C-Space>',
      [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
      { expr = true, noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      'i', '<CR>',
      [[pumvisible() ? "\<C-e><CR>" : "\<CR>"]],
      { expr = true, noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      'i', '<C-j>',
      [[pumvisible() ? "\<C-n>" : "\<C-n>"]],
      { expr = true, noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      'i', '<C-k>',
      [[pumvisible() ? "\<C-p>" : "\<C-p>"]],
      { expr = true, noremap = true, silent = true }
    )
  end,
}
