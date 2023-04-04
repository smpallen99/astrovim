return {
  {
    "johmsalas/text-case.nvim",
    enabled = true,
    lazy = false,
    config = function()
      require("textcase").setup {
        -- on_attach = function()
        --   local map = function(mode, lhs, rhs, opts) vim.keymap.set(mode, lhs, rhs, opts) end
        --
        --   map(
        --     -- { "n", "v" },
        --     "n",
        --     "<leader>cCn",
        --     "<cmd>lua require 'textcase'.operator('to_constant_case')<cr>",
        --     { buffer = true, noremap = true, desc = "CONSTANT_CASE" }
        --   )
        --   map(
        --     { "n", "v" },
        --     "<leader>cCd",
        --     "<cmd>lua require 'textcase'.operator('to_dot_case')<cr>",
        --     { desc = "dot.case" }
        --   )
        --   map(
        --     { "n", "v" },
        --     "<leader>cCz",
        --     "<cmd>lua require 'textcase'.operator('to_phrase_case')<cr>",
        --     { desc = "Phrase case" }
        --   )
        --   map(
        --     { "n", "v" },
        --     "<leader>cCt",
        --     "<cmd>lua require 'textcase'.operator('to_title_case')<cr>",
        --     { desc = "Title Case" }
        --   )
        --   map(
        --     { "n", "v" },
        --     "<leader>cCa",
        --     "<cmd>lua require 'textcase'.operator('to_path_case')<cr>",
        --     { desc = "path/case" }
        --   )
        --   map(
        --     { "n", "v" },
        --     "<leader>cCc",
        --     "<cmd>lua require 'textcase'.operator('to_camel_case')<cr>",
        --     { desc = "camelCase" }
        --   )
        --   map(
        --     { "n", "v" },
        --     "<leader>cCp",
        --     "<cmd>lua require 'textcase'.operator('to_pascal_case')<cr>",
        --     { desc = "PascalCase" }
        --   )
        -- end,
      }
      require("telescope").load_extension "textcase"
      vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
    end,
  },
}
