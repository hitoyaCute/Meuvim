-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local table_concat = function (a, temp)
  for _, value in ipairs(a) do
    table.insert(temp, value)
  end
  return temp
end

-- Disable the space-bar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true})

-- for conciseness
local opts = { noremap = true, silent = true }

-- save and format
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", table_concat(opts, { desc = "Format and Save" }))

-- classic space -> w
vim.keymap.set("n", "<leader>w", "<cmd>noautocmd w <CR>", table_concat(opts, { desc = "Save the current file" }))

-- quit file
vim.keymap.set("n", "<leader>q", "<cmd> q <CR>", table_concat(opts, { desc = "Quit the current window" }))

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', table_concat(opts, { desc = "Delete single char" }))

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", table_concat(opts, { desc = "Vertical scroll up" }))
vim.keymap.set("n", "<C-u>", "<C-u>zz", table_concat(opts, { desc = "Vertical scroll down" }))

-- Find and center
vim.keymap.set("n", "n", "nzzzv", table_concat(opts, { desc = "Go to the next" }))
vim.keymap.set("n", "N", "Nzzzv", table_concat(opts, { desc = "Go to the previous" }))

-- Resize with arrows
vim.keymap.set("n", "<C-Up>",    ":resize -2<CR>",          table_concat(opts, { desc = "Resize Up" }))
vim.keymap.set("n", "<C-Down>",  ":resize +2<CR>",          table_concat(opts, { desc = "Resize Down" }))
vim.keymap.set("n", "<C-Left>",  ":vertical resize -2<CR>", table_concat(opts, { desc = "Resize Left" }))
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", table_concat(opts, { desc = "Resize Right" }))

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", table_concat(opts, { desc = "Move to previous window" })) -- go to previous window
vim.keymap.set("n", "<C-l>", "<C-w>l", table_concat(opts, { desc = "Move to next window" })) -- go to next window
vim.keymap.set("n", "<C-j>", "<C-w>j", table_concat(opts, { desc = "Move to window bellow" })) -- move to the window bellow
vim.keymap.set("n", "<C-k>", "<C-w>k", table_concat(opts, { desc = "Move to window above" })) -- move to the window above

-- Tabs navigation
vim.keymap.set("n", "<leader>to", ":tabnew<CR>",   table_concat(opts, { desc = "Create new tab" }))
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", table_concat(opts, { desc = "Close the current tab" }))
vim.keymap.set("n", "<leader>tn", ":tabn<CR>",     table_concat(opts, { desc = "Go to next tab" })) -- go to next tab
vim.keymap.set("n", "<leader>tb", ":tabp<CR>",     table_concat(opts, { desc = "Go to previous tab" })) -- go to previous tab

-- better indenting
vim.keymap.set("v", "<", "<gv", table_concat(opts, { desc = "Indent" })) -- indent
vim.keymap.set("v", ">", ">gv", table_concat(opts, { desc = "Unindent" })) -- unindent

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', table_concat(opts, { desc = "Paste without yanking" }))

-- move current line
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv-gv'", table_concat(opts, { desc = "Move current line" }))


