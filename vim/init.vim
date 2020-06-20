let mapleader = ','
let maplocalleader = '//'

"minpac start------------
packadd minpac
call minpac#init()

call minpac#add('kristijanhusak/vim-hybrid-material')
call minpac#add('neoclide/coc.nvim')
call minpac#add('junegunn/fzf')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('mhinz/vim-grepper')
call minpac#add('janko-m/vim-test')

call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
"minpac end--------------

"theme start-------------
set background=dark
colorscheme hybrid_material
"theme end---------------

"Fuzzy search start-------------
nnoremap <C-p> :<C-u>FZF<CR>
"Fuzzy search end---------------

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
"Ggrep start-------------
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep']

"Current word search
nnoremap <Leader>g : Grepper -tool rg<CR>
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
"Grep end---------------

"map config start-------
inoremap <c-u> <esc>viwUi
inoremap <c-l> <esc>viwui
inoremap jk <esc>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <Leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <Leader>" <esc>`<i"<esc>`>a"<esc>
"map config end---------

"Common start-----------
"Common end-------------

"js,ts start --------------
augroup filetype_js_ts
  autocmd!
  autocmd Filetype javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd Filetype typescript nnoremap <buffer> <localleader>c I//<esc>
augroup END
"js, ts end  --------------
