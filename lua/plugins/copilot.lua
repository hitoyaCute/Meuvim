-- Advanced GitHub Copilot Configuration for Neovim
-- Place this in your lazy.nvim plugins configuration

return {
  -- {
  --   "github/copilot.vim",
  --   event = "InsertEnter",
  --   config = function()
  --     -- ============================================================
  --     -- KEYBINDINGS
  --     -- ============================================================
  --
  --     -- Disable default Tab mapping (we'll use custom)
  --     vim.g.copilot_no_tab_map = true
  --
  --     -- Accept suggestion with Ctrl+J (more ergonomic than Tab)
  --     vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  --       expr = true,
  --       replace_keycodes = false,
  --       desc = "Accept Copilot suggestion",
  --     })
  --
  --     -- Alternative: Use Tab but only when Copilot has suggestions
  --     vim.keymap.set("i", "<Tab>", function()
  --       if vim.fn["copilot#GetDisplayedSuggestion"]().text ~= "" then
  --         return vim.fn["copilot#Accept"] "\\<CR>"
  --       else
  --         return "\t"
  --       end
  --     end, {
  --       expr = true,
  --       replace_keycodes = false,
  --       desc = "Accept Copilot or Tab",
  --     })
  --
  --     -- Accept word-by-word (useful for partial acceptance)
  --     vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", {
  --       desc = "Accept Copilot word",
  --     })
  --
  --     -- Accept line-by-line
  --     vim.keymap.set("i", "<C-K>", "<Plug>(copilot-accept-line)", {
  --       desc = "Accept Copilot line",
  --     })
  --
  --     -- Navigate through suggestions
  --     vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", {
  --       desc = "Next Copilot suggestion",
  --     })
  --     vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", {
  --       desc = "Previous Copilot suggestion",
  --     })
  --
  --     -- Dismiss suggestion
  --     vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)", {
  --       desc = "Dismiss Copilot suggestion",
  --     })
  --
  --     -- Open Copilot panel (shows 10 suggestions)
  --     vim.keymap.set("i", "<M-\\>", "<Plug>(copilot-suggest)", {
  --       desc = "Trigger Copilot suggestion",
  --     })
  --
  --     -- Toggle Copilot on/off
  --     vim.keymap.set("n", "<leader>cp", function()
  --       if vim.g.copilot_enabled == 1 then
  --         vim.cmd "Copilot disable"
  --         vim.notify("Copilot disabled", vim.log.levels.INFO)
  --       else
  --         vim.cmd "Copilot enable"
  --         vim.notify("Copilot enabled", vim.log.levels.INFO)
  --       end
  --     end, {
  --       desc = "Toggle Copilot",
  --     })
  --
  --     -- Show Copilot status
  --     vim.keymap.set("n", "<leader>cs", "<cmd>Copilot status<cr>", {
  --       desc = "Copilot status",
  --     })
  --
  --     -- Open Copilot panel in normal mode
  --     vim.keymap.set("n", "<leader>co", "<cmd>Copilot panel<cr>", {
  --       desc = "Open Copilot panel",
  --     })
  --
  --     -- ============================================================
  --     -- FILETYPE CONFIGURATION
  --     -- ============================================================
  --
  --     -- Enable/disable Copilot for specific filetypes
  --     vim.g.copilot_filetypes = {
  --       -- Programming languages (enabled)
  --       ["*"] = true, -- Enable for all by default
  --       c = true,
  --       cpp = true,
  --       python = true,
  --
  --       -- Markup/config (enabled but less intrusive)
  --       markdown = true,
  --       json = false,
  --       yaml = true,
  --       toml = true,
  --       xml = false,
  --       html = true,
  --       css = true,
  --
  --       -- Disable for certain files
  --       gitcommit = true,        -- No suggestions in git commits
  --       gitrebase = true,
  --       [".env"] = false,        -- No suggestions in env files
  --       ["."] = false,           -- Hidden files
  --       TelescopePrompt = false, -- Telescope
  --       help = false,            -- Help files
  --
  --       -- Shell scripts
  --       sh = true,
  --       bash = true,
  --       zsh = true,
  --
  --       -- Documentation
  --       tex = true,
  --       plaintex = true,
  --     }
  --
  --     -- ============================================================
  --     -- WORKSPACE CONFIGURATION
  --     -- ============================================================
  --
  --     -- Set workspace trust (for monorepos/enterprise)
  --     vim.g.copilot_workspace_folders = {
  --       vim.fn.expand "~" .. "/projects",
  --       vim.fn.expand "~" .. "/work",
  --       vim.fn.expand "~" .. "/src",
  --       vim.fn.expand "~" .. "/lib",
  --       vim.fn.expand "~" .. "/include",
  --       -- Add your project directories here
  --     }
  --
  --     -- ============================================================
  --     -- PROXY CONFIGURATION (if behind corporate proxy)
  --     -- ============================================================
  --
  --     -- Uncomment and configure if you're behind a proxy
  --     -- vim.g.copilot_proxy = "http://proxy.company.com:8080"
  --     -- vim.g.copilot_proxy_strict_ssl = false
  --
  --     -- ============================================================
  --     -- NODE.JS CONFIGURATION
  --     -- ============================================================
  --
  --     -- Specify custom Node.js path if needed
  --     -- vim.g.copilot_node_command = "/usr/local/bin/node"
  --     -- vim.g.copilot_node_command = vim.fn.expand("~/.nvm/versions/node/v18.0.0/bin/node")
  --
  --     -- ============================================================
  --     -- CUSTOM AUTOCOMMANDS
  --     -- ============================================================
  --
  --     local copilot_group = vim.api.nvim_create_augroup("CopilotCustom", { clear = true })
  --
  --     -- Auto-enable Copilot when entering insert mode in code files
  --     vim.api.nvim_create_autocmd("InsertEnter", {
  --       group = copilot_group,
  --       pattern = "*",
  --       callback = function()
  --         local ft = vim.bo.filetype
  --         -- Enable for programming languages only
  --         local code_fts = { "c", "cpp", "python", "javascript", "typescript", "lua", "rust", "go", "java" }
  --         for _, code_ft in ipairs(code_fts) do
  --           if ft == code_ft then
  --             vim.cmd "Copilot enable"
  --             break
  --           end
  --         end
  --       end,
  --     })
  --
  --     -- Disable Copilot in large files (performance)
  --     vim.api.nvim_create_autocmd("BufReadPre", {
  --       group = copilot_group,
  --       pattern = "*",
  --       callback = function()
  --         local max_filesize = 100 * 1024 -- 100 KB
  --         local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
  --         if ok and stats and stats.size > max_filesize then
  --           vim.cmd "Copilot disable"
  --           vim.notify("Copilot disabled for large file", vim.log.levels.WARN)
  --         end
  --       end,
  --     })
  --
  --     -- Show notification when Copilot suggestion is available
  --     vim.api.nvim_create_autocmd("User", {
  --       group = copilot_group,
  --       pattern = "CopilotSuggestion",
  --       callback = function()
  --         -- Optional: Add custom logic when suggestion appears
  --         -- Example: highlight cursor line differently
  --         vim.opt.cursorline = true
  --       end,
  --     })
  --
  --     -- ============================================================
  --     -- CUSTOM COMMANDS
  --     -- ============================================================
  --
  --     -- Command to restart Copilot
  --     vim.api.nvim_create_user_command("CopilotRestart", function()
  --       vim.cmd "Copilot disable"
  --       vim.defer_fn(function()
  --         vim.cmd "Copilot enable"
  --         vim.notify("Copilot restarted", vim.log.levels.INFO)
  --       end, 500)
  --     end, { desc = "Restart Copilot" })
  --
  --     -- Command to check Copilot suggestions count
  --     vim.api.nvim_create_user_command("CopilotStats", function()
  --       local suggestion = vim.fn["copilot#GetDisplayedSuggestion"]()
  --       if suggestion.text ~= "" then
  --         vim.notify("Copilot has suggestions available", vim.log.levels.INFO)
  --       else
  --         vim.notify("No Copilot suggestions", vim.log.levels.WARN)
  --       end
  --     end, { desc = "Check Copilot stats" })
  --
  --     -- Command to open Copilot logs
  --     vim.api.nvim_create_user_command("CopilotLogs", function()
  --       local log_path = vim.fn.expand "~/.config/github-copilot/logs"
  --       if vim.fn.isdirectory(log_path) == 1 then
  --         vim.cmd("edit " .. log_path)
  --       else
  --         vim.notify("Copilot logs not found", vim.log.levels.ERROR)
  --       end
  --     end, { desc = "Open Copilot logs" })
  --
  --     -- ============================================================
  --     -- SUGGESTION APPEARANCE
  --     -- ============================================================
  --
  --     -- Customize suggestion highlight
  --     vim.api.nvim_set_hl(0, "CopilotSuggestion", {
  --       fg = "#555555",
  --       italic = true,
  --       underline = false,
  --     })
  --
  --     -- Customize annotation (the "Copilot" text)
  --     vim.api.nvim_set_hl(0, "CopilotAnnotation", {
  --       fg = "#888888",
  --       italic = true,
  --     })
  --
  --     -- ============================================================
  --     -- PERFORMANCE TUNING
  --     -- ============================================================
  --
  --     -- Debounce time (milliseconds) - how long to wait before showing suggestions
  --     -- Lower = faster suggestions, Higher = less CPU usage
  --     vim.g.copilot_idle_delay = 100 -- Default is 75ms
  --
  --     -- Maximum number of suggestions to cache
  --     vim.g.copilot_max_suggestion_count = 10
  --
  --     -- ============================================================
  --     -- ADVANCED: Context Configuration
  --     -- ============================================================
  --
  --     -- Function to provide additional context to Copilot
  --     local function get_copilot_context()
  --       local context = {}
  --
  --       -- Add current file path
  --       context.file_path = vim.fn.expand "%:p"
  --
  --       -- Add git branch if in a git repo
  --       local git_branch = vim.fn.system "git branch --show-current 2>/dev/null"
  --       if vim.v.shell_error == 0 then
  --         context.git_branch = vim.trim(git_branch)
  --       end
  --
  --       -- Add project root
  --       local project_root = vim.fn.getcwd()
  --       context.project_root = project_root
  --
  --       return context
  --     end
  --
  --     -- ============================================================
  --     -- DEBUGGING
  --     -- ============================================================
  --
  --     -- Enable verbose logging (uncomment for debugging)
  --     -- vim.g.copilot_log_file = vim.fn.expand("~/.local/state/nvim/copilot.log")
  --
  --     -- Function to debug Copilot state
  --     vim.keymap.set("n", "<leader>cd", function()
  --       local status = vim.fn["copilot#Enabled"]()
  --       local suggestion = vim.fn["copilot#GetDisplayedSuggestion"]()
  --
  --       print("Copilot Enabled:", status)
  --       print("Has Suggestion:", suggestion.text ~= "")
  --       print("Filetype:", vim.bo.filetype)
  --       print("Buffer:", vim.api.nvim_buf_get_name(0))
  --     end, {
  --       desc = "Debug Copilot",
  --     })
  --
  --     -- ============================================================
  --     -- INTEGRATION WITH OTHER PLUGINS
  --     -- ============================================================
  --
  --     -- Integrate with lualine (status line)
  --     -- Add this to your lualine config:
  --     -- sections = {
  --     --   lualine_x = {
  --     --     {
  --     --       function()
  --     --         local status = vim.fn['copilot#Enabled']()
  --     --         if status == 1 then
  --     --           return ' Copilot'
  --     --         else
  --     --           return ''
  --     --         end
  --     --       end,
  --     --     },
  --     --   },
  --     -- }
  --
  --     -- ============================================================
  --     -- INITIAL SETTINGS
  --     -- ============================================================
  --
  --     -- Start with Copilot enabled
  --     vim.g.copilot_enabled = 1
  --
  --     -- Assume yes for Copilot agreement
  --     vim.g.copilot_assume_mapped = true
  --
  --     -- Set default tab behavior
  --     vim.g.copilot_tab_fallback = ""
  --
  --     -- Print startup message
  --     vim.defer_fn(function()
  --       if vim.fn["copilot#Enabled"]() == 1 then
  --         vim.notify("GitHub Copilot loaded successfully", vim.log.levels.INFO)
  --       end
  --     end, 1000)
  --   end,
  -- },

  -- ============================================================
  -- OPTIONAL: Add CopilotChat for chat interface
  -- ============================================================
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      -- enable the chat to view git commits and project files
      git_integration = true,
      files_access = true,
      debug = false,
      model = "gpt-4o",
      temperature = 0.1,
      question_header = "## User ",
      answer_header = "## Copilot ",
      error_header = "## Error ",
      prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN Write a detailed explanation for the selected code in the active buffer.",
        },
        Review = {
          prompt = "/COPILOT_REVIEW Review the selected code and provide suggestions for improvement.",
        },
        Fix = {
          prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.",
        },
        Optimize = {
          prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readability.",
        },
        Docs = {
          prompt = "/COPILOT_GENERATE Please add comprehensive documentation comments for the selection.",
        },
        Tests = {
          prompt = "/COPILOT_GENERATE Please generate comprehensive unit tests for my code.",
        },
        FixDiagnostic = {
          prompt = "Please assist with the following diagnostic issue in file:",
        },
        Commit = {
          prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        },
        CommitStaged = {
          prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        },
      },
    },
    keys = {
      -- Chat commands
      { "<leader>ccc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      { "<leader>ccr", "<cmd>CopilotChatReset<cr>", desc = "Reset Copilot Chat" },

      -- Quick actions
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code" },
      {
        "<leader>cct",
        "<cmd>CopilotChatTests<cr>",
        mode = { "n", "v" },
        desc = "Generate tests",
      },
      { "<leader>ccf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix code" },
      { "<leader>cco", "<cmd>CopilotChatOptimize<cr>", mode = { "n", "v" }, desc = "Optimize code" },
      { "<leader>ccd", "<cmd>CopilotChatDocs<cr>", mode = { "n", "v" }, desc = "Generate docs" },
      { "<leader>ccv", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review code" },

      -- Git integration
      { "<leader>ccm", "<cmd>CopilotChatCommit<cr>", desc = "Generate commit message" },
      { "<leader>ccM", "<cmd>CopilotChatCommitStaged<cr>", desc = "Generate commit for staged" },

      -- Custom prompt
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input "Quick Chat: "
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick chat",
      },

      -- Diagnostic fix
      { "<leader>ccx", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix diagnostic" },
    },
  },
}
