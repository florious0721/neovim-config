return {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
        local status_ok, url_open = pcall(require, "url-open")
        if not status_ok then
            return
        end
        url_open.setup({
          extra_patterns = {
            {
              pattern = '(http://localhost:%d+[%w-_%.%%%?%.:/+=&%%[%]#]*)',
              prefix = '',
              suffix = '',
              file_patterns = nil,
              excluded_file_patterns = nil,
              extra_condition = nil,
            },
          },
        })
        vim.api.nvim_set_keymap('n', 'gu', '<Cmd>URLOpenUnderCursor<Enter>', {noremap = true, silent = true})
    end,
}
