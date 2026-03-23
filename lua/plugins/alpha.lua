-- ~/.config/nvim/lua/meuvim/plugins/alpha.lua
return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    -- Header (ASCII Art)
    dashboard.section.header.val = {
      "███╗   ███╗███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "████╗ ████║██╔════╝██║   ██║██║   ██║██║████╗ ████║",
      "██╔████╔██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╔╝██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚═╝ ██║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝     ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "                    M E U V I M                    ",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "  Config", ":e " .. vim.env.MEUVIM_BASE_DIR .. "<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer
    local function footer()
      local stats = require("lazy").stats()
      local datetime = os.date "%Y-%m-%d %H:%M:%S"
      return "⚡ MeuVim loaded " .. stats.count .. " plugins in " .. stats.startuptime .. "ms | " .. datetime
    end
    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Comment"
    dashboard.section.header.opts.hl = "Type"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    -- Make Alpha background black on entry
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        vim.cmd "hi Normal guibg=#000000"
        vim.cmd "hi NormalNC guibg=#000000"
      end,
    })

    -- Restore transparent background when leaving Alpha
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.cmd "hi Normal guibg=none"
        vim.cmd "hi NormalNC guibg=none"
      end,
    })
  end,
}

-- {
--   'goolord/alpha-nvim',
--   dependencies = {
--     'nvim-tree/nvim-web-devicons',
--   },
--
--   config = function()
--     local alpha = require 'alpha'
--     local dashboard = require 'alpha.themes.startify'
--
--     dashboard.section.header.val = {
--       [[ .##.....##.########.##.....##.##.....##.####.##.....## ]],
--       [[ .###...###.##.......##.....##.##.....##..##..###...### ]],
--       [[ .####.####.##.......##.....##.##.....##..##..####.#### ]],
--       [[ .##.###.##.######...##.....##.##.....##..##..##.###.## ]],
--       [[ .##.....##.##.......##.....##..##...##...##..##.....## ]],
--       [[ .##.....##.##.......##.....##...##.##....##..##.....## ]],
--       [[ .##.....##.########..#######.....###....####.##.....## ]],
--     }
--
--     alpha.setup(dashboard.opts)
--   end,
-- }
