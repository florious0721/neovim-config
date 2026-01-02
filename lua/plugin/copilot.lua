return {
  --'github/copilot.vim',
  'zbirenbaum/copilot.lua',
  --requires = {'copilotlsp-nvim/copilot-lsp'},

  cmd = 'Copilot',
  config = function()
    require('copilot').setup()
  end,
}
