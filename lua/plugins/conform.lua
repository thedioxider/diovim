-- Format all git-tracked files in a directory using conform.
-- Uses `git ls-files` to skip ignored files (node_modules, build output, etc.).
-- Suppresses all autocommands during buffer load (eventignore = "all") to prevent
-- LSP from attaching to temporary buffers — without this, codelens callbacks fire
-- after the buffer is deleted, causing "Invalid buffer id" errors.
-- Buffers that were already open are preserved.
local function format_directory(dir)
  local conform = require("conform")
  local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1] or vim.fn.getcwd()
  local files = vim.fn.systemlist("git ls-files " .. vim.fn.shellescape(dir))
  local formatted = 0
  for _, file in ipairs(files) do
    local path = root .. "/" .. file
    local ft = vim.filetype.match({ filename = path })
    if ft and conform.formatters_by_ft[ft] then
      local was_loaded = vim.fn.bufloaded(path) == 1
      local bufnr = vim.fn.bufadd(path)
      local old_ei = vim.o.eventignore
      vim.o.eventignore = "all"
      vim.fn.bufload(bufnr)
      vim.o.eventignore = old_ei
      conform.format({ bufnr = bufnr, async = false, lsp_fallback = false })
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("silent! write")
      end)
      if not was_loaded then
        vim.api.nvim_buf_delete(bufnr, { force = true })
      end
      formatted = formatted + 1
    end
  end
  vim.notify(string.format("Formatted %d files", formatted))
end

---@type LazySpec
return {
  { import = "astrocommunity.editing-support.conform-nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    opts = {
      commands = {
        format_directory = function(state)
          local node = state.tree:get_node()
          local path = node.type == "directory" and node:get_id() or vim.fn.fnamemodify(node:get_id(), ":h")
          format_directory(path)
        end,
      },
      window = {
        mappings = {
          gF = "format_directory",
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier_rasi = {
          command = "prettier",
          args = { "--parser", "css", "--stdin-filepath", "$FILENAME" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        nix = { "nixfmt" },
        python = { "black" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        rasi = { "prettier_rasi" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        qml = { "qmlformat" },
        markdown = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        java = { "google-java-format" },
        toml = { "taplo" },
        xml = { "xmlformat" },
        lua = { "stylua" },
        rust = { "rustfmt" },
        kotlin = { "ktlint" },
        dockerfile = { "dockerfmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
