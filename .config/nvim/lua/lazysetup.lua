-- vim:ft=lua:fileencoding=utf-8



lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim', '--branch=stable', lazypath })
end

vim.opt.rtp:prepend(lazypath)
