---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      -- Disable inlay hints during format-on-save to avoid stale-position
      -- extmark crashes when conform rewrites the buffer while inlay hint
      -- responses are in flight.
      inlay_hints_format_guard = {
        {
          event = "BufWritePre",
          desc = "Disable inlay hints before format-on-save",
          callback = function(args)
            if vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }) then
              vim.b[args.buf].inlay_hints_were_enabled = true
              vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
            end
          end,
        },
        {
          event = "BufWritePost",
          desc = "Re-enable inlay hints after format-on-save",
          callback = function(args)
            if vim.b[args.buf].inlay_hints_were_enabled then
              vim.b[args.buf].inlay_hints_were_enabled = nil
              vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end
          end,
        },
      },
      -- Show ~ on last line if file ends with a trailing newline (like Helix)
      trailing_newline_indicator = {
        {
          event = { "BufRead", "BufWritePost", "TextChanged", "TextChangedI" },
          desc = "Show ~ on last line if file ends with newline",
          callback = function(args)
            local bufnr = args.buf
            local ns = vim.api.nvim_create_namespace("trailing_newline")
            vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
            if vim.bo[bufnr].buftype ~= "" then return end
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
