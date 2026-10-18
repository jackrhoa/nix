local M = {}

M.viewer = { 'sioyek', '--instance-name', 'preview' }

M.open = vim.list_extend(vim.deepcopy(M.viewer), {
  '--inverse-search', 'sioyek-inverse-search %1 %2',
  '--execute-command', 'toggle_synctex',
})

M.tdf_split = {
  'osascript',
  '-e', 'on run argv',
  '-e', 'tell application "Ghostty"',
  '-e', 'set t to focused terminal of selected tab of front window',
  '-e', 'set cfg to new surface configuration',
  '-e', 'set command of cfg to "' .. '/etc/profiles/per-user/' .. vim.env.USER .. '/bin/tdf' .. ' " & quoted form of (item 1 of argv)',
  '-e', 'split t direction right with configuration cfg',
  '-e', 'focus t',
  '-e', 'end tell',
  '-e', 'end run',
}

pcall(vim.fn.serverstart, '/tmp/nvim-preview.sock')

local synctex_pdf = {}

vim.api.nvim_create_autocmd('User', {
  pattern = 'PreviewCompileSuccess',
  callback = function(args)
    synctex_pdf[args.data.bufnr] = args.data.output
  end,
})

vim.api.nvim_create_autocmd('User', {
  pattern = 'PreviewWatchingStopped',
  callback = function(args)
    synctex_pdf[args.data.bufnr] = nil
  end,
})

function _G.PreviewSynctex(file, line)
  vim.cmd('drop ' .. vim.fn.fnameescape(file))
  vim.api.nvim_win_set_cursor(0, { tonumber(line), 0 })
  vim.cmd('normal! zz')
end

vim.keymap.set('n', '<leader>s', function()
  local pdf = synctex_pdf[vim.api.nvim_get_current_buf()]
  if not pdf then
    vim.notify('preview: no compiled PDF for this buffer', vim.log.levels.WARN)
    return
  end
  vim.fn.jobstart(vim.list_extend(vim.deepcopy(M.viewer), {
    '--forward-search-file', vim.fn.expand('%:p'),
    '--forward-search-line', tostring(vim.fn.line('.')),
    pdf,
  }))
end)

return M
