vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("i", "ii", "<Esc>", { desc = "Map 'ii' to Escape in Insert mode" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })  -- Normal mode
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })  -- Visual mode
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l:Ex<CR>", { desc = "Open vertical split and move focus to the new buffer" })
vim.keymap.set("n", "<leader>t", ":tabnew<CR>:Ex<CR>", { desc = "Open a new tab and netrw" })

vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to the left pane" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to the right pane" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to the upper pane" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to the lower pane" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move entire line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move entire line up" })

-- Abbreviation for console.log()
vim.cmd("iabbrev log console.log(")

-- Window size adjustments
vim.keymap.set("n", "<leader>=", ":vertical resize +10<CR>", { desc = "Increase pane width by 10" })
vim.keymap.set("n", "<leader>-", ":vertical resize -10<CR>", { desc = "Decrease pane width by 10" })
vim.keymap.set("n", "<leader>+", "<C-w>=", { desc = "Make all panes equal width" })

-- Key mappings for commenting with different characters
vim.keymap.set("v", "/", ":<C-u>lua require('utils').CommentSelection('//')<CR>", { desc = "Comment with // in Visual mode" })
vim.keymap.set("v", "#", ":<C-u>lua require('utils').CommentSelection('#')<CR>", { desc = "Comment with # in Visual mode" })
vim.keymap.set("v", "-", ":<C-u>lua require('utils').CommentSelection('--')<CR>", { desc = "Comment with # in Visual mode" })

-- Open directory in netrw
vim.keymap.set("n", "<leader>d", ":Ex<CR>", { desc = "Open netrw" })


-- Search and replace with '<leader>s'
vim.keymap.set("n", "<leader>s", function()
  -- Prompt for the search and replace terms
  local search = vim.fn.input("Search: ")
  local replace = vim.fn.input("Replace: ")
  if search ~= "" then
    -- Execute the search and replace across the entire buffer
    vim.cmd(":%s/" .. search .. "/" .. replace .. "/g")
  else
    print("Search term cannot be empty!")
  end
end, { desc = "Search and replace in entire buffer" })
