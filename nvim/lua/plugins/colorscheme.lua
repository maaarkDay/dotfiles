return {
   -- Colorscheme the colorscheme should be available when starting Neovim
 {
   "folke/tokyonight.nvim",
   lazy = false, -- make sure we load this during startup if it is your main colorscheme
   priority = 1000, -- make sure to load this before all the other start plugins
   config = function()
--       -- load the colorscheme here
     vim.cmd([[colorscheme tokyonight]])
   end,
 },

--   {
--     "Shatur/neovim-ayu",
--     name = "ayu",
--     lazy = false, -- so it loads immediately
--     priority = 1000, -- ensure it loads before other plugins that might depend on colors
--     config = function()
--       require("ayu").setup({
--         mirage = true, -- or true if you want the 'mirage' variant
--         terminal = true, -- let ayu set terminal colors
--         overrides = {
--           -- Example override: make Normal transparent
--             Normal = { bg = "None" },
--         },
--       })
--       require("ayu").colorscheme() -- finally apply the scheme
--     end
--   },

--   {
--     "rose-pine/neovim",
--     name = "rose-pine",     -- So lazy can identify it uniquely
--     lazy = false,           -- Load during startup
--     priority = 1000,        -- Ensure it loads before other start plugins
--     config = function()
--       require("rose-pine").setup({
--         --- Set your preferred variant (options: 'main', 'moon', 'dawn')
--         variant = 'moon',
--         dark_variant = 'moon',
--         -- You can also configure other settings, for example:
--         -- disable_background = true,
--         -- disable_italics = true,
--         -- groups = {
--         --   background = 'none',
--         --   panel = 'none',
--         -- },
--       })
--       -- Finally, apply the colorscheme
--       vim.cmd([[colorscheme rose-pine]])
--     end,
--   },
}
