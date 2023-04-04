return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "mhanberg/elixir.nvim",
    ft = { "elixir", "eex", "heex", "surface" },
    config = function()
      local elixir = require "elixir"

      elixir.setup {
        settings = elixir.settings {
          enableTestLenses = true,
          suggestSpecs = true,
        },
        log_level = vim.lsp.protocol.MessageType.Log,
        message_level = vim.lsp.protocol.MessageType.Log,
        on_attach = function(client, bufnr)
          local map_opts = { buffer = true, noremap = true }
          -- whatever keybinds you want, see below for more suggestions
          vim.keymap.set("n", ",r", vim.lsp.codelens.run, map_opts)
          vim.keymap.set("n", "<space>Fep", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>Fet", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "tpope/vim-projectionist",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
  },
}
