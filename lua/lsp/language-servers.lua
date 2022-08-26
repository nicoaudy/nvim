-- Setup LSP
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local langservers = {
  'html',
  'cssls',
  'tsserver',
  'ls_emmet',
  'sumneko_lua'
}

for _, server in ipairs(langservers) do
  require'lspconfig'[server].setup {
    capabilities = capabilities
  }
end
