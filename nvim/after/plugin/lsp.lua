local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  keybindings.lspOnAttachKeyMaps(opts)

  if client.supports_method('textDocument/formatting') then
    require('lsp-format').on_attach(client)
  end
end
)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

require('null-ls').setup()

require("mason-null-ls").setup({
  automatic_installation = true,
  handlers = {},
})

require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
  },
  mapping = cmp.mapping.preset.insert(
  ---@diagnostic disable-next-line: undefined-global
    keybindings.cmpKeyMaps(cmp, cmp_action)
  ),
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = require('lspkind').cmp_format({
      mode = 'symbol_text',
      maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...',
    })
  }
})
