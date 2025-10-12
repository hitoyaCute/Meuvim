-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local table_concat = function (a, temp)
  for _, value in ipairs(a) do
    table.insert(temp, value)
  end
  return temp
end

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true})

-- for conciseness
local opts = { noremap = true, silent = true }

-- save and format
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", table_concat(opts, { desc = "Format and Save" }))

-- classic space -> w
vim.keymap.set("n", "<leader>w", "<cmd>noautocmd w <CR>", table_concat(opts, { desc = "Save the current file" }))

-- quit file
vim.keymap.set("n", "<leader>q", "<cmd> q <CR>", table_concat(opts, { desc = "Quit the current window" }))

-- delete single character without coppying into register
vim.keymap.set("n", "x", '"_x', table_concat(opts, { desc = "Delete single char" }))

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", table_concat(opts, { desc = "Vertical scroll up" }))
vim.keymap.set("n", "<C-u>", "<C-u>zz", table_concat(opts, { desc = "Vertical scroll down" }))

-- Find and center
vim.keymap.set("n", "n", "nzzzv", table_concat(opts, { desc = "Go to the next" }))
vim.keymap.set("n", "N", "Nzzzv", table_concat(opts, { desc = "Go to the previous" }))

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", table_concat(opts, { desc = "Resize Up" }))
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", table_concat(opts, { desc = "Resize Down" }))
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", table_concat(opts, { desc = "Resize Left" }))
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", table_concat(opts, { desc = "Resize Right" }))

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- go to previous window
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- go to next window
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- move to the window bellow
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- move to the window abouve

-- Tabs navigation
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) -- go to next tab
vim.keymap.set("n", "<leader>tb", ":tabp<CR>", opts) -- go to prevoius tab

-- better indenting
vim.keymap.set("v", "<", "<gv", opts) -- indent
vim.keymap.set("v", ">", ">gv", opts) -- unindent

-- Keep last yancked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- move current line
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv-gv'", opts)


