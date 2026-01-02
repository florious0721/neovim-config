return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local cc = require('codecompanion')
    cc.setup({
      adapters = {
        http = {
          bigmodel = function()
            return require('codecompanion.adapters').extend('deepseek', {
              name = '智谱',
              url = 'https://open.bigmodel.cn/api/paas/v4/chat/completions',
              env = {
                api_key = 'BIGMODEL_API_KEY',
                --url = '',
                models_endpoint = '/models',
                chat_url = '/chat/completions',
              },
              opts = {
                stream = true,
              },
              schema = {
                model = {
                  default = 'glm-4.5-flash',
                  choices = {
                    ['glm-4.5-flash'] = {opts = {can_reason = true}},
                  },
                },
                temperature = {default = 0.3},
              },
            })
          end,
        },
      },
      interactions = {
        chat = {adapter = {name = 'copilot', model = 'claude-sonnet-4.5'}},
      },
      opts = {
        log_level = 'DEBUG',
      },
    })
    vim.keymap.set('n', '<leader>ait', cc.toggle)
  end,
}
