-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "poimandres",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      poimandres = {
        LspReferenceText = { bg = "#363a4f" },
        LspReferenceRead = { bg = "#363a4f" },
        LspReferenceWrite = { bg = "#363a4f" },
        FlashLabel = { fg = "#1B1E28", bg = "#5FB3A1", bold = true },
        NeoTreeFloatBorder = { fg = "#506477", bg = "#1B1E28" },
        NeoTreeTitleBar = { fg = "#E4F0FB", bg = "#506477", bold = true },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {},
  },
}
