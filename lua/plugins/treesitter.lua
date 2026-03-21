return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- event = { "BufReadPost", "BufNewFile" }, -- lazy load on file open
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
    },
    -- main = "nvim-treesitter.configs",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua",
          "python",
          "javascript",
          "typescript",
          "vimdoc",
          "vim",
          "regex",
          "cpp",
          "terraform",
          "sql",
          "dockerfile",
          "toml",
          "json",
          "java",
          "groovy",
          "go",
          "gitignore",
          "graphql",
          "yaml",
          "make",
          "cmake",
          "markdown",
          "markdown_inline",
          "bash",
          "tsx",
          "css",
          "html",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },

        -- Incremental selection: expand/shrink selection by syntax node
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<bs>",
          },
        },

        -- Textobjects: select/move/swap by function, class, parameter, etc.
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- jump forward to next match automatically
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- adds to jumplist so <C-o> works
            goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
            goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
            goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
            goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
          },
          swap = {
            enable = true,
            swap_next = { ["<leader>sp"] = "@parameter.inner" },
            swap_previous = { ["<leader>sP"] = "@parameter.inner" },
          },
        },
      })
    end
  },

  -- Shows current function/class context pinned at top of buffer
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      max_lines = 3, -- max lines the context window can take up
      trim_scope = "outer",
      mode = "cursor",
    },
    keys = {
      { "<leader>tc", "<cmd>TSContextToggle<cr>", desc = "Toggle treesitter context" },
    },
  },
}
