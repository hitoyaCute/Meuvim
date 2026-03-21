local M = {}
M.noauto = false

function M.test()
  print "meh"
end

function M.NoAutoOn()
  local noauto = {
    "set noautoindent nosmartindent nocindent indentexpr=",
    "lua require('nvim-autopairs').disable()",
    "lua require('cmp').setup.buffer { enable = false }",
    "set formatoptions-=cro",
    "LspStop",
  }
  for _, cmd in ipairs(noauto) do
    vim.cmd(cmd)
  end
end

function M.NoAutoOff()
  local auto = {
    "set autoindent smartindent cindent indentexpr<",
    "lua require('nvim-autopairs').enable()",
    "lua require('cmp').setup.buffer { enable = true }",
    "set formatoptions+=cro",
    "LspStart",
  }
  for _, cmd in ipairs(auto) do
    vim.cmd(cmd)
  end
end

function M.NoAutoToggle()
  M.noauto = not M.noauto

  local func = M.noauto and M.NoAutoOn or M.NoAutoOff
  func()

  -- if M.noauto then
  --   vim.opt_local.formatoptions:remove({"c","r","o"})
  -- else
  --   vim.opt_local.formatoptions:append({"c","r","o"})
  -- end

  -- print("Presentation mode " .. (M.noauto and "On" or "Off"))
end


vim.api.nvim_create_user_command("NoAutoToggle", M.NoAutoToggle, {})

vim.keymap.set("n", "<leader>plm", M.NoAutoOn, { desc = "enable presentation mode" })
vim.keymap.set("n", "<leader>pln", M.NoAutoOff, { desc = "disable presentation mode" })
-- auto off --
-- setlocal noautoindent nosmartindent nocindent
-- lua require('nvim-autopairs').disable()
-- lua require('cmp').setup.buffer { enable = false }
-- LspStop
--
--
-- auto on --
-- setlocal autoindent smartindent cindent
-- lua require('nvim-autopairs').enable()
-- lua require('cmp').setup.buffer { enable = true }
-- LspStart
--

return M
