return {
  'neovim/nvim-lspconfig',
  dependencies = {'saghen/blink.cmp'},
  ft = {
    'c', 'cpp',
    'python', 'zig'
  },
  config = function()
    local capa = require('blink.cmp').get_lsp_capabilities()
    local lspcfg = require('lspconfig')

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = {buffer = ev.buf}
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>lf', function()
          vim.lsp.buf.format({async = true})
        end, opts)
      end
    })

    lspcfg.clangd.setup({
      capabilities = capa,
      cmd = {
        'clangd',
        '--clang-tidy',
        '--completion-style=detailed',
        '--enable-config',
        '--function-arg-placeholders=0',
        '--header-insertion=never',
        '--header-insertion-decorators',
      },
      filetypes = {
        'c', 'cpp', 'objc',
        'objcpp', 'cuda', 'proto',
      },
      single_file_support = true,
    })
    require('lspconfig').pylsp.setup({capabilities = capa})
    require('lspconfig').zls.setup({
      capabilities = capa,
      settings = {
        enable_argument_placeholders = true,
        enable_build_on_save = true,
        enable_snippets = true,
        warn_style = true,
      },
    })
  end,
}
