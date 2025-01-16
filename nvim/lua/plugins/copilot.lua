return {
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = ",,",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          markdown = true,
          help = false,
        },
      })
    end,
  },

  -- Copilot chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",  -- Fixed repository name
    branch = "main",
    dependencies = {
        "zbirenbaum/copilot.lua",
        "nvim-lua/plenary.nvim",
    },
    cmd = {
        "CopilotChat",
        "CopilotChatToggle",
        "CopilotChatExplain",
        "CopilotChatTests",
        "CopilotChatFix",
        "CopilotChatDocs",
    },
    keys = {
        { "<leader>c", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
        { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
        { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Fix code" },
        { "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "Generate docs" },
        -- Visual mode mappings
        { "<leader>ce", ":CopilotChatExplain<cr>", mode = "v", desc = "Explain selected code" },
        { "<leader>c", ":CopilotChatTests<cr>", mode = "v", desc = "Generate tests for selected code" },
        { "<leader>ccf", ":CopilotChatFix<cr>", mode = "v", desc = "Fix selected code" },
        { "<leader>ccd", ":CopilotChatDocs<cr>", mode = "v", desc = "Generate docs for selected code" },
    },
    opts = {
        debug = false,
        show_help = true,
        prompts = {
            Explain = "Explain how this code works:",
            Tests = "Generate tests for this code:",
            Fix = "Review and fix any bugs in this code:",
            Docs = "Write documentation for this code:",
        },
    },
  }
}
