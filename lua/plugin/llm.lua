return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    require("codecompanion").setup({
      adapters = {
        http = {
          bigmodel = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                api_key = "BIGMODEL_API_KEY",
                url = "https://open.bigmodel.cn/api/paas/v4/",
                model = 'glm-4.5-flash',
                chat_url = "/chat/completions",
                models_endpoint = "/models",
              },
              headers = {
                ["Content-Type"] = "application/json",
                --[[["Authorization"] = "Bearer ${api_key}",
                ["HTTP-Referer"] = "https://github.com/olimorris/codecompanion.nvim",
                ["X-Title"] = "CodeCompanion.nvim",]]
              },
              schema = {
                model = {default = 'glm-4.5-flash'}
              },
            })
          end,
        },
      },
      strategies = {
        chat = {
          adapter = "bigmodel",
        },
        inline = {
          adapter = "bigmodel",
        },
      },
    })
  end,
}
