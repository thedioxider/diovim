-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Auto-change cwd to detected project root
    rooter = {
      autochdir = true,
    },
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = {
        virtual_text = true,
        virtual_lines = true,
      }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      virtual_lines = { current_line = true },
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true,
        breakindent = true,
        breakindentopt = "shift:2",
        showbreak = "↪ ",
        scrolloff = 8, -- keep 8 lines above/below cursor
        clipboard = "", -- don't auto-sync with system clipboard
        undofile = true, -- persistent undo history across sessions
        expandtab = true, -- use spaces instead of tabs
        tabstop = 4, -- tab width
        shiftwidth = 4, -- indent width
        softtabstop = 4, -- backspace through spaces
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        icons_enabled = true,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- line navigation
        ["gh"] = { "^", desc = "Go to beginning of line" },
        ["gl"] = { "$", desc = "Go to end of line" },

        -- splits (disable defaults, move to leader)
        ["\\"] = false,
        ["|"] = false,
        ["<Leader>\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
        ["<Leader>|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },

        -- swap ; and . (. for f/t repeat forward, ; for repeat last edit)
        [";"] = { ".", desc = "Repeat last edit" },
        ["."] = { ";", desc = "Repeat f/t forward" },

        -- system clipboard
        ["<A-y>"] = { '"+y', desc = "Yank to system clipboard" },
        ["<A-p>"] = { '"+p', desc = "Paste from system clipboard" },

        -- selection
        ["<A-a>"] = { "ggVG", desc = "Select all" },

        -- navigate buffer tabs
        ["<A-l>"] = {
          function()
            require("astrocore.buffer").nav(vim.v.count1)
          end,
          desc = "Next buffer",
        },
        ["<A-h>"] = {
          function()
            require("astrocore.buffer").nav(-vim.v.count1)
          end,
          desc = "Previous buffer",
        },
        ["<A-c>"] = {
          function()
            require("astrocore.buffer").close()
          end,
          desc = "Close buffer",
        },

        -- tabs
        ["<Leader><Tab>"] = { desc = "Tabs" },
        ["<Leader><Tab>n"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader><Tab>c"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
        ["<Leader><Tab>o"] = { "<cmd>tabonly<cr>", desc = "Close other tabs" },
        ["<Leader><Tab>l"] = { "<cmd>tabnext<cr>", desc = "Next tab" },
        ["<Leader><Tab>h"] = { "<cmd>tabprevious<cr>", desc = "Previous tab" },
        ["<Leader><Tab>L"] = { "<cmd>tabmove +1<cr>", desc = "Move tab right" },
        ["<Leader><Tab>H"] = { "<cmd>tabmove -1<cr>", desc = "Move tab left" },

        -- config
        ["<Leader>pr"] = { "<cmd>AstroReload<cr>", desc = "Reload AstroNvim" },
        ["<Leader>pc"] = {
          function()
            require("snacks.picker").files({ cwd = vim.fn.stdpath("config") })
          end,
          desc = "Open config",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        -- line navigation
        ["gh"] = { "^", desc = "Go to beginning of line" },
        ["gl"] = { "g_", desc = "Go to end of line" },

        -- system clipboard
        ["<A-y>"] = { '"+y', desc = "Yank to system clipboard" },
        ["<A-p>"] = { '"+p', desc = "Paste from system clipboard" },
      },
    },
  },
}
