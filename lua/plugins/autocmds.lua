---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      -- Show ~ on last line if file ends with a trailing newline (like Helix)
      trailing_newline_indicator = {
        {
          event = { "BufRead", "BufWritePost", "TextChanged", "TextChangedI" },
          desc = "Show ~ on last line if file ends with newline",
          callback = function(args)
            local bufnr = args.buf
            local ns = vim.api.nvim_create_namespace("trailing_newline")
            vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
            if vim.bo[bufnr].eol then
              local last_line = vim.api.nvim_buf_line_count(bufnr)
              vim.api.nvim_buf_set_extmark(bufnr, ns, last_line - 1, 0, {
                virt_lines = { { { "~", "NonText" } } },
              })
            end
          end,
        },
      },
    },
  },
}
