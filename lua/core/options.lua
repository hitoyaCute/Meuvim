-- ============================================================
-- Editor appearance
-- ============================================================
vim.opt.number        = true
vim.opt.relativenumber = true   -- relative numbers are very useful with motions
vim.opt.numberwidth   = 4
vim.opt.cursorline    = true
vim.opt.termguicolors = true
vim.opt.signcolumn    = "yes"   -- always show; prevents layout shift from LSP
vim.opt.showmode      = false   -- redundant if you use a statusline plugin
vim.opt.showtabline   = 0       -- hide tabline (set to 2 to always show)
vim.opt.wrap          = false
vim.opt.scrolloff     = 8
vim.opt.sidescrolloff = 6
vim.opt.smoothscroll  = true
vim.opt.laststatus    = 2       -- 1 = only with splits, 2 = always, 3 = global


-- ============================================================
-- Indentation  (one source of truth — 4 spaces)
-- ============================================================
vim.opt.expandtab    = true
vim.opt.shiftwidth   = 4
vim.opt.tabstop      = 4
vim.opt.softtabstop  = 4
vim.opt.autoindent   = true
vim.opt.smartindent  = true   -- adds a bit more context-awareness than autoindent


-- ============================================================
-- Search
-- ============================================================
vim.opt.ignorecase = true
vim.opt.smartcase  = true   -- override ignorecase when query has uppercase


-- ============================================================
-- Files & persistence
-- ============================================================
vim.opt.fileencoding = "utf-8"   -- utf-32 is almost certainly not what you want
vim.opt.swapfile     = false
vim.opt.undofile     = true
vim.opt.undodir      = vim.fn.stdpath("data") .. "/undodir"  -- keep undo history in one place


-- ============================================================
-- Editing behaviour
-- ============================================================
vim.opt.clipboard    = "unnamedplus"   -- sync with system clipboard
vim.opt.mouse        = "a"
vim.opt.updatetime   = 300             -- faster CursorHold triggers (LSP hover, etc.)
vim.opt.pumheight    = 12              -- max completion menu items
vim.opt.completeopt  = "menuone,noselect"
vim.opt.shortmess:append("c")         -- suppress ins-completion messages


-- ============================================================
-- Window splits
-- ============================================================
vim.opt.splitbelow = true
vim.opt.splitright = true


-- ============================================================
-- Neovide (only applied when running inside Neovide)
-- ============================================================
if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode             = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_density = 32.0
end
