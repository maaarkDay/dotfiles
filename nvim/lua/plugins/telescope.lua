return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              -- Map Esc to close Telescope in insert mode
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
      })
    end,
  },

  -- Optional: Telescope extensions (e.g., FZF for better fuzzy finding)
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
  },
}
