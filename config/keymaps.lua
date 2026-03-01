vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>w", "<cmd>w<CR>", opts)  -- Save
map("n", "<leader>q", "<cmd>q<CR>", opts)  -- Quit
map("n", "<leader>Q", "<cmd>q!<CR>", opts) -- force quit

map("n", "<leader>d", "<cmd>TransparentToggle<CR>", opts) -- Transparent toggle
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" }) -- Find files
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" }) -- search for words
map("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Old files" }) -- find old files

map("n", "<A-h>", ":ToggleTerm direction=horizontal<CR>", opts) -- Horizontal terminal
map("n", "<A-v>", ":ToggleTerm direction=vertical <CR>", opts) -- Vertical terminal
map("n", "<A-i>", ":ToggleTerm direction=float<CR>", opts) -- Float terminal

map("n", "<C-h>", "<C-w>h", opts) -- Move to left window
map("n", "<C-j>", "<C-w>j", opts) -- Move to bottom window
map("n", "<C-k>", "<C-w>k", opts) -- Move to top window
map("n", "<C-l>", "<C-w>l", opts) -- Move to right window
map("n", "<C-Up>", ":resize -2<CR>", opts) -- Resize window up
map("n", "<C-Down>", ":resize +2<CR>", opts) -- Resize window down
map("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Resize window left
map("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Resize window right
map("n", "<C-d>", "<C-d>zz") -- Scroll half a page down
map("n", "<C-u>", "<C-u>zz") -- Scroll half a page up
map("v", "J", ":m '>+1<CR>gv=gv") -- Move down
map("v", "K", ":m '<-2<CR>gv=gv") -- Move up


map("n", "<leader>tn", ":tabnew<CR>", opts) -- New tab
map("n", "<leader>tc", ":tabclose<CR>", opts) -- Close tab
map("n", "<leader>to", ":tabonly<CR>", opts) -- Close all tabs
map("n", "<leader>]", ":tabnext<CR>", opts) -- Next tab
map("n", "<leader>[", ":tabprev<CR>", opts) -- Previous tab
map("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
map("n", "K", vim.lsp.buf.hover, opts) -- Hover
map("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename
map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code action
map("n", "gr", vim.lsp.buf.references, opts) -- References
map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, opts) -- Format
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

