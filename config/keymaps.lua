vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>w", "<cmd>w<CR>", opts)
map("n", "<leader>q", "<cmd>q<CR>", opts)
map("n", "<leader>e", ":Ex<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })

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

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
