-- return {
--   plugins = {
--     "johnsoncodehk/volar",
--     {
--       "williamboman/mason-lspconfig.nvim",
--       on_init = function(client)
-- 		    client.server_capabilities.documentFormattingProvider = false
-- 		    client.server_capabilities.documentFormattingRangeProvider = false
--       end,
--     },
--   },
-- }
--
return {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  init_options = {
    typescript = {
      tsdk = "/usr/local/lib/node_modules/typescript/lib",
    },
  },
}
