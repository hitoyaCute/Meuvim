return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-mini/mini.icons",
  },
  event = "VeryLazy",
  opts = {
    -- Use new keys instead of old “icons”, “window”, etc.
    preset = "classic",     -- or "modern", "helix", etc.
    delay = 200,             -- delay before popup (can also be function)
    filter = function(mapping)
      return mapping.desc ~= nil  -- only show mappings with descriptions
    end,

    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },

    icons = {
      breadcrumb = " ",   -- shows the active key combo in command-line area
      separator  = "",   -- symbol between key and its label
      group      = " ",   -- prefix for group names
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        D = "󰘳 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "󰁮",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },


    layout = {
      height = { min = 4, max = 25 },
      width  = { min = 20, max = 60 },
      spacing = 3,
      align = "center",
    },

    show_help = true,
    show_keys = true,

    notify = true,
    triggers = { { "<auto>", mode = "nxso" } },
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,

    spec = {},  -- you can put default mappings here
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.add({
      {"<leader>M", group = "MeuVim", icon = ""},
      {"<leader>Mc", "<cmd>e ~/.config/nvim/init.lua<CR>", desc = "configure Meuvim", mode = "n"},
      {"<leader>Mr", "<cmd>source ~/.config/nvim/init.lua<CR>", desc = "Reload Meuvim", mode = "n"},
      {"<leader>t", group = "Tab navigation", mode = "n"},
      {"<leader>s", group = "Telescope (search)"},
    })
  end

}



