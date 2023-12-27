local M = {}

function M.staticKeyMaps()
  -- neo-tree
  vim.keymap.set('n', '<C-n>', function()
    require("neo-tree.command").execute({ toggle = true })
  end, {}
  )

  -- telescope
  local builtin = require("telescope.builtin")
  vim.keymap.set('n', '<C-p>', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
end

function M.lspOnAttachKeyMaps(opts)
  -- lsp
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  vim.keymap.set({ 'n', 'x' }, '<leader>fa', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)
end

function M.cmpKeyMaps(cmp, cmp_action)
  return {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }
end

return M
