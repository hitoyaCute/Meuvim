-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- for conciseness
local opts = { noremap = true, silent = true }

-- save and format
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- classic space -> w
vim.keymap.set('n', '<leader>w', '<cmd>noautocmd w <CR>', opts)

-- quit file
vim.keymap.set('n', '<leader>q', '<cmd> q <CR>', opts)

-- delete single character without coppying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opt) -- go to previous window
vim.keymap.set('n', '<C-l>', '<C-w>l', opt) -- go to next window
vim.keymap.set('n', '<C-j>', '<C-w>j', opt) -- move to the window bellow
vim.keymap.set('n', '<C-k>', '<C-w>k', opt) -- move to the window abouve

-- Tabs navigation
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) -- go to next tab
vim.keymap.set('n', '<leader>tb', ':tabp<CR>', opts) -- go to prevoius tab

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts) -- indent
vim.keymap.set('v', '>', '>gv', opts) -- unindent

-- Keep last yancked when pasting
vim.keymap.set('v', 'p', '"_dP', opt)









