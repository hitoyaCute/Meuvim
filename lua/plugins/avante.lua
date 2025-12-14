-- Using lazy.nvim
{
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "claude",
    auto_suggestions_provider = "claude",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-sonnet-4-20250514",
      temperature = 0,
      max_tokens = 8000,
    },
    behaviour = {
      auto_suggestions = true, -- Enable auto suggestions
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
    },
    mappings = {
      ask = "<leader>aa",      -- Ask Claude about selection/current file
      edit = "<leader>ae",     -- Edit with Claude's help
      refresh = "<leader>ar",  -- Refresh suggestions
      diff = {
        ours = "co",           -- Accept our changes
        theirs = "ct",         -- Accept Claude's changes
        all_theirs = "ca",     -- Accept all of Claude's changes
        both = "cb",           -- Keep both changes
        cursor = "cc",         -- Go to current change
        next = "]x",           -- Next change
        prev = "[x",           -- Previous change
      },
      suggestion = {
        accept = "<M-l>",      -- Accept suggestion (Alt+l)
        next = "<M-]>",        -- Next suggestion
        prev = "<M-[>",        -- Previous suggestion
        dismiss = "<C-]>",     -- Dismiss suggestion
      },
      jump = {
        next = "]]",           -- Jump to next block
        prev = "[[",           -- Jump to previous block
      },
      submit = {
        normal = "<CR>",       -- Submit in normal mode
        insert = "<C-s>",      -- Submit in insert mode
      },
    },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right",      -- Position of suggestion window
      wrap = true,
      width = 30,              -- Width percentage
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua", -- optional, for comparison
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
