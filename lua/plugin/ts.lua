return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  config = function(_, opts)
    require('nvim-treesitter.install').prefer_git = false
    require('nvim-treesitter.configs').setup(opts)
  end,

  --[[init = function()
    for _, cfg in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
      cfg.install_info.url = cfg.install_info.url:gsub('https://github.com/', 'ssh://git@github.com/')
    end
  end,]]

  opts = {
    auto_install = false,
    ensure_installed = {
      'bash', 'comment', 'rst',
      'c', 'cpp',
      'lua', 'python',
      'cmake', 'meson',
    },
    highlight = {enable = true},
    incremental_selection = {enable = false},
    indent = {enable = false},
  },
}
