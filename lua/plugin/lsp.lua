return {
  'neovim/nvim-lspconfig',
  dependencies = {'saghen/blink.cmp'},
  ft = {
    'c', 'cpp', 'cs', 'go', 'gomod', 'gosum',
    'python', 'zig'
  },
  config = function()
    local capa = require('blink.cmp').get_lsp_capabilities()
    local lsp = vim.lsp

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

    lsp.enable('clangd')
    lsp.enable('gopls')
    lsp.enable('pylsp')
    lsp.enable('roslyn_ls')
    lsp.enable('zls')

    lsp.config('clangd',{
      capabilities = capa,
      cmd = {
        'clangd',
        '--clang-tidy',
        '--completion-style=detailed',
        '--enable-config',
        --'--header-insertion-decorators',
      },
      filetypes = {
        'c', 'cpp', 'objc',
        'objcpp', 'cuda', 'proto',
      },
      single_file_support = true,
    })

    lsp.config('gopls', {capabilities = capa})

    lsp.config('pylsp', {capabilities = capa})
    --[[lsp.config('roslyn_ls', {
      cmd = {
        "Microsoft.CodeAnalysis.LanguageServer",
        "--logLevel", "Information",
        "--extensionLogDirectory", "/tmp/roslyn_ls/logs",
        --"--stdio"
      },
    })]]
    lsp.config('zls', {
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
