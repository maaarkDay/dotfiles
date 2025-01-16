return {
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp", -- Completion engine
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",   -- Buffer completions
      "hrsh7th/cmp-path",     -- Path completions
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",           -- Install and manage LSP servers
      "williamboman/mason-lspconfig.nvim", -- Bridge Mason with LSP
    },
    config = function()
      -- Configure Mason
      require("mason").setup()

      -- Ensure required LSP servers are installed
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls" }, -- Add other servers as needed
      })

      -- Setup LSP servers
      local lspconfig = require("lspconfig")

      -- Common on_attach function for keymaps
      local on_attach = function(client, buffer)
        local opts = { noremap = true, silent = true, buffer = buffer }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      -- ts_ls (JavaScript/TypeScript)
      lspconfig.ts_ls.setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = on_attach,
      })

      -- lua_ls (Lua)
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }, -- Recognize `vim` as a global
            },
          },
        },
      })
    end,
  },
}
