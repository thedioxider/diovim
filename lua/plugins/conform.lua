---@type LazySpec
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      nix = { "nixfmt" },
      python = { "black" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
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
}
