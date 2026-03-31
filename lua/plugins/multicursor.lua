---@type LazySpec
return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  dependencies = {
    {
      "folke/which-key.nvim",
      opts = {
        spec = {
          { "<up>", hidden = true },
          { "<down>", hidden = true },
          { "<LocalLeader><up>", hidden = true },
          { "<LocalLeader><down>", hidden = true },
          { "<LocalLeader>n", hidden = true },
          { "<LocalLeader>s", hidden = true },
          { "<LocalLeader>N", hidden = true },
          { "<LocalLeader>S", hidden = true },
          { "<LocalLeader>x", hidden = true },
        },
      },
    },
  },
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below
    set({ "n", "x" }, "<up>", function()
      mc.lineAddCursor(-1)
    end)
    set({ "n", "x" }, "<down>", function()
      mc.lineAddCursor(1)
    end)
    set({ "n", "x" }, "<LocalLeader><up>", function()
      mc.lineSkipCursor(-1)
    end)
    set({ "n", "x" }, "<LocalLeader><down>", function()
      mc.lineSkipCursor(1)
    end)

    -- Add or skip cursor by matching word/selection
    set({ "n", "x" }, "<LocalLeader>n", function()
      mc.matchAddCursor(1)
    end)
    set({ "n", "x" }, "<LocalLeader>s", function()
      mc.matchSkipCursor(1)
    end)
    set({ "n", "x" }, "<LocalLeader>N", function()
      mc.matchAddCursor(-1)
    end)
    set({ "n", "x" }, "<LocalLeader>S", function()
      mc.matchSkipCursor(-1)
    end)

    -- Mouse
    set("n", "<C-leftmouse>", mc.handleMouse)
    set("n", "<C-leftdrag>", mc.handleMouseDrag)
    set("n", "<C-leftrelease>", mc.handleMouseRelease)

    -- Toggle cursor
    set({ "n", "x" }, "<C-q>", mc.toggleCursor)

    -- Keymap layer: only active when multiple cursors exist
    mc.addKeymapLayer(function(layerSet)
      layerSet({ "n", "x" }, "<left>", mc.prevCursor)
      layerSet({ "n", "x" }, "<right>", mc.nextCursor)
      layerSet({ "n", "x" }, "<LocalLeader>x", mc.deleteCursor)
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end,
}
