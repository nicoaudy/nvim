local null_ls_status_ok, null_ls = pcall(require, "null_ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "graphql", "handlebars", "svelte" },
      only_local = "node_modules/.bin",
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
      vim.api.nvim_create_autocmd(
        "BufWritePre",
        { buffer = bufnr, callback = vim.lsp.buf.format({ async = true }), group = group }
      )
    end
  end,
})
