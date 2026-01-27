vim.opt.fillchars:append { eob = " " }
vim.opt.clipboard      = 'unnamedplus'
vim.opt.completeopt    = { 'menu', 'menuone', 'noselect' }
vim.opt.undofile       = true
-- vim.opt.guicursor = ""
vim.opt.cursorline     = true
-- vim.opt.cursorlineopt = "number"
-- vim.opt.colorcolumn = ""
vim.opt.wrap           = false
vim.opt.splitright     = true

vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true
vim.opt.scrolloff      = 15

vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.cursorline     = true
vim.opt.splitbelow     = true
vim.opt.splitright     = true
vim.opt.termguicolors  = true
vim.opt.showmode       = false
vim.opt.ttyfast        = true
vim.opt.smoothscroll   = true
-- vim.opt.autochdir = true

vim.opt.incsearch      = true
vim.opt.hlsearch       = false
vim.opt.ignorecase     = true
vim.opt.smartcase      = true

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = ""
  }
})
