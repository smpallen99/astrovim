return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format {
        bufnr = bufnr,
      }
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint,
    }

    config.onattach = function(client, bufnr)
      if client.supports_method "textDocument/formatting" then
        vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function() lsp_formatting(bufnr) end,
        })
      end
    end

    return config -- return final config table
  end,
}
