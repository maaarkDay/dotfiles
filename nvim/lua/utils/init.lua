local M = {}

-- Define the CommentSelection function
function M.CommentSelection(commentChar)
  -- Get the start and end line numbers of the selection
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Loop through each line in the selection
  for line = start_line, end_line do
    local current_line = vim.fn.getline(line)
    -- Toggle comment: Uncomment if already commented, otherwise comment
    if vim.startswith(current_line, commentChar .. " ") then
      -- Uncomment by removing the comment prefix
      vim.fn.setline(line, string.sub(current_line, #commentChar + 2))
    else
      -- Comment by adding the comment prefix
      vim.fn.setline(line, commentChar .. " " .. current_line)
    end
  end
end

return M
