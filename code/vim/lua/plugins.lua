local fn = vim.fn
local install_path = fn.stdpath('data')..'/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  -- Common
  use 'tpope/vim-projectionist'
  use 'tpope/vim-dispatch'
  use 'radenling/vim-dispatch-neovim'
  use 'mhinz/vim-grepper'
  use 'janko-m/vim-test'
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'tpope/vim-obsession'
  use 'sgur/vim-editorconfig'
  use 'jiangmiao/auto-pairs'
  use 'mattn/emmet-vim'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'udalov/kotlin-vim'
  use 'terryma/vim-multiple-cursors'
  use 'tpope/vim-eunuch'
  use 'aserebryakov/vim-todo-lists'
  use {'cespare/vim-toml',branch = 'main'}
  use 'mbbill/undotree'
  use 'jremmen/vim-ripgrep'
  use 'tpope/vim-commentary'
  use 'vim-airline/vim-airline'
  use 'preservim/tagbar'
  use 'voldikss/vim-floaterm'
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'puremourning/vimspector'
  use 'szw/vim-maximizer'
  use 'arcticicestudio/nord-vim'
  use 'folke/todo-comments.nvim'
  use 'jschmold/sweet-dark.vim'
  use 'lbrayner/vim-rzip'
  -- Web development
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  -- lsp server
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  -- packer manager
  use 'wbthomason/packer.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
