local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--depth=1',
    '--single-branch',
    '--branch=stable',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if (vim.uv or vim.loop).fs_stat(lazypath .. '/lua/lazy/init.lua') then
  require('lazy').setup({
    git = {url_format = 'https://github.com/%s.git'},
    install = {missing = true},
    spec = {{import = 'plugin'}},
    ui = {
      icons = {
        cmd = 'Command',
        config = 'Option',
        event = 'Event',
        ft = 'File',
        init = 'Init',
        keys = 'Key',
        plugin = 'Plugin',
        runtime = 'Runtime',
        source = 'Source',
        start = 'Start',
        task = 'Task',
        lazy = 'Lazy',
      },
    },
  })
end
