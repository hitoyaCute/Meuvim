return { -- Autocompletion
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
    },
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    luasnip.config.setup {}

    -- --------------------------------------------------------
    -- Doxygen tag cleaner
    -- clangd sends hover docs with raw \brief, \param, etc.
    -- This converts them to readable markdown before cmp
    -- renders the documentation float.
    -- --------------------------------------------------------
    local function clean_doxygen(str)
      if not str then
        return str
      end
      return str
          -- brief: just drop the tag, keep the text
          :gsub("[\\@]brief%s+", "")
          -- params → markdown list items
          :gsub("[\\@]param%[in,out%]%s+", "\n- **`[in,out]`** ")
          :gsub("[\\@]param%[in%]%s+", "\n- **`[in]`** ")
          :gsub("[\\@]param%[out%]%s+", "\n- **`[out]`** ")
          :gsub("[\\@]param%s+", "\n- **param** ")
          :gsub("[\\@]tparam%s+", "\n- **tparam** ")
          -- returns / throws
          :gsub("[\\@]returns?%s+", "\n**Returns:** ")
          :gsub("[\\@]throws?%s+", "\n**Throws:** ")
          -- callouts
          :gsub("[\\@]note%s+", "\n> **Note:** ")
          :gsub("[\\@]warning%s+", "\n> **Warning:** ")
          :gsub("[\\@]deprecated%s+", "\n> **Deprecated:** ")
          :gsub("[\\@]since%s+", "\n**Since:** ")
          :gsub("[\\@]version%s+", "\n**Version:** ")
          -- code spans
          :gsub("[\\@]code%s*", "\n```\n")
          :gsub("[\\@]endcode%s*", "\n```\n")
          :gsub("[\\@][cp]%s+([%w_:]+)", "`%1`") -- \c or \p → `ident`
          :gsub("[\\@]ref%s+([%w_:]+)", "`%1`") -- \ref     → `ident`
          :gsub("[\\@]a%s+([%w_]+)", "*%1*")   -- \a name  → *name*
          -- strip any leftover unknown tags so they don't leak
          :gsub("[\\@]%a+%s*", "")
    end

    -- Patch cmp's entry documentation getter so the cleaner runs
    -- for every source, not just nvim_lsp.
    local cmp_entry = require "cmp.entry"
    local _orig_get_documentation = cmp_entry.get_documentation
    cmp_entry.get_documentation = function(self)
      local doc = _orig_get_documentation(self)
      if not doc then
        return doc
      end
      if type(doc) == "table" and doc.value then
        doc.value = clean_doxygen(doc.value)
      elseif type(doc) == "string" then
        doc = clean_doxygen(doc)
      end
      return doc
    end

    -- --------------------------------------------------------
    -- Kind icons
    -- --------------------------------------------------------
    local kind_icons = {
      Text = "󰉿",
      Method = "m",
      Function = "󰊕",
      Constructor = "",
      Field = "",
      Variable = "󰆧",
      Class = "󰌗",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰇽",
      Struct = "",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "󰊄",
    }

    -- --------------------------------------------------------
    -- cmp setup
    -- --------------------------------------------------------
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      completion = { completeopt = "menu,menuone,noinsert" },

      mapping = cmp.mapping.preset.insert {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete {},
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },

      sources = {
        { name = "lazydev", group_index = 0 },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },

      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          col_offset = 0,
          side_padding = 1,
          border = "rounded",
        },
        documentation = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          border = "rounded",
          -- these two are required for markdown to render correctly
          max_width = 80,
          max_height = 20,
        },
      },
    }
  end,
}
