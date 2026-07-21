-- nix LSP
vim.lsp.enable('nil_ls')
vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = { delay = 300, virt_text_pos = 'eol' },
})

vim.diagnostic.config({ virtual_text = true })
vim.o.completeopt = 'noselect,menu,menuone,fuzzy,popup'
vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get)
vim.keymap.set('i', '<C-@>', vim.lsp.completion.get)
-- Open Git blame window
vim.keymap.set('n', '<leader>gb', require('gitsigns').blame)

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
