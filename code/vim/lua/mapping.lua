--
-- Setting mapping
--
--


HOME = os.getenv("HOME")
vim.g.mapleader = ','
vim.g.maplocalleader = '//'

-- Map key functions
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end
-- Setup fuzz search
nmap('<C-p>',':<C-u>FZF<CR>')
vim.g.fzf_layout = {window = {width= 0.8,height= 0.8}}

vim.g.grepper = { tools = {'rg', 'grep'}}

nmap('<Leader>g' ,': Grepper -tool rg<CR>')
nmap('<Leader>*', ':Grepper -cword -noprompt<CR>')

vim.opt.title=true
vim.opt.tabstop=2 
vim.opt.softtabstop=0
vim.opt.expandtab=true
vim.opt.shiftwidth=2 
vim.opt.smarttab=true
vim.opt.relativenumber=true
vim.opt.hidden=true
vim.opt.smartindent=true
vim.opt.nu=true
vim.opt.undodir=HOME .. '/.nvim/undodir'
vim.opt.undofile=true
vim.opt.incsearch=true
vim.opt.scrolloff=8
vim.opt.cmdheight=2
vim.opt.updatetime=50
vim.opt.shortmess:append({c=true})
vim.opt.colorcolumn:append({80})
vim.opt.updatetime=300
vim.g.netrw_browse_split = 2
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

vim.g.floaterm_keymap_new    = '<F7>'
vim.g.floaterm_keymap_prev   = '<F8>'
vim.g.floaterm_keymap_next   = '<F9>'
vim.g.floaterm_keymap_toggle = '<F12>'
vim.g.maximizer_set_default_mapping = 1
vim.g.maximizer_default_mapping_key = '<F3>'

