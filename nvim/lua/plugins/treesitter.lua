return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate", -- Automatically update parsers
    config = function()

      -- JSDoc highlights for Ayu colorscheme
      local highlights = {
          ["@type.jsdoc"] = { fg = "#367f8e" }, -- dark blue
          ["@property.jsdoc"] = { fg = "#cc8a51" }, --orange
          ["@keyword.jsdoc"] = { fg = "#99673d" }, -- dark orange
          ["@variable.jsdoc"] = { fg = "#cc8a51" }, --orange
          ["@variable.parameter.jsdoc"] = { fg = "#cc8a51" }, --orange
          ["@punctuation.jsdoc"] = { fg = "#cc8a51" }, --orange
          ["@punctuation.delimiter.jsdoc"] = { fg = "#cc8a51" }, --orange
          ["@punctuation.bracket.jsdoc"] = { fg = "#4299ab" }, -- blue
      }

         for group, settings in pairs(highlights) do
             vim.api.nvim_set_hl(0, group, settings)
         end

      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "json", "jsdoc" }, -- Install specific parsers
        highlight = {
          enable = true, -- Enable syntax highlighting
        },
        indent = {
          enable = true, -- Enable indentation based on Tree-sitter
        },
        fold = {
          enable = true, -- Enable fold based on Tree-sitter
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            node_decremental = "grm",
          },
        },
      })
    end,
  },

  -- Playground
  {
    "nvim-treesitter/playground",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-treesitter.configs").setup({
        playground = {
          enable = true,
          updatetime = 25, -- Debounced time for highlighting nodes
          persist_queries = false,
        },
      })
    end,
  },
}
