vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)
map("n", "<leader>Q", "<cmd>q!<CR>", opts)

map("n", "<leader>d", "<cmd>TransparentToggle<CR>", opts)
-- map("n", "<leader>e", ":Sex!<CR>", opts)
-- local function toggle_netrw()
--   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "netrw" then
--       vim.api.nvim_buf_delete(buf, { force = true })
--       return
--     end
--   end
--   vim.cmd("Vex!")  -- open if no netrw found
-- end

-- init.lua

-- local function netrw_mapping()
--   local bufnr = vim.api.nvim_get_current_buf()
--
--   local function bind(lhs, rhs, desc)
--     vim.keymap.set('n', lhs, rhs, { buffer = bufnr, remap = true, desc = desc })
--   end
--   bind('<C-l>', '<C-w>l')
-- end

-- Create the autocmd
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'netrw',
--   callback = netrw_mapping,
-- })
--
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*',
--   callback = function()
--       if vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == 'netrw' then
--           vim.cmd('q')
--       end
--   end,
-- })

-- map("n", "<leader>e", toggle_netrw, opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Old files" })

map("n", "<A-h>", ":ToggleTerm direction=horizontal<CR>", opts)
map("n", "<A-v>", ":ToggleTerm direction=vertical <CR>", opts)
map("n", "<A-i>", ":ToggleTerm direction=float<CR>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")


map("n", "<leader>tn", ":tabnew<CR>", opts)
map("n", "<leader>tc", ":tabclose<CR>", opts)
map("n", "<leader>to", ":tabonly<CR>", opts)
map("n", "<leader>]", ":tabnext<CR>", opts)
map("n", "<leader>[", ":tabprev<CR>", opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts)
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    map('t', '<esc>', [[<C-\><C-n>]], opts)
    map("t", "<C-c>", [[<C-\><C-n>]], opts)
    map('t', 'jk', [[<C-\><C-n>]], opts)
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    map('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
    map("t", "<A-h>", [[<Cmd>wincmd q<CR>]], opts)
    map("t", "<A-v>", [[<Cmd>wincmd q<CR>]], opts)
    map("t", "<A-i>", [[<Cmd>wincmd q<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

