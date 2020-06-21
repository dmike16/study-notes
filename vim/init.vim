let mapleader = ','
let maplocalleader = '//'

"minpac start------------ {{{
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
call minpac#add('preservim/nerdtree')

call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" }}}

"theme start------------- {{{
set background=dark
colorscheme hybrid_material
"}}}

"Fuzzy search start------------- {{{
nnoremap <C-p> :<C-u>FZF<CR>
" }}}

"Ggrep start------------- {{{
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep']

"Current word search
nnoremap <Leader>g : Grepper -tool rg<CR>
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
" }}}

"map config start------- {{{
inoremap <c-u> <esc>viwUi
inoremap <c-l> <esc>viwui
inoremap jk <esc>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <Leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <Leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <c-r> "0y:%s/<c-r>0//gc<left><left><left>
" }}}

"Common start----------- {{{
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" }}}

"js,ts start -------------- {{{
augroup filetype_js_ts
  autocmd!
  autocmd Filetype javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd Filetype typescript nnoremap <buffer> <localleader>c I//<esc>
augroup END
" }}}
" vim start --------------- {{{
augroup filetype_vim
  autocmd!
  autocmd Filetype vim setlocal foldmethod=marker
augroup END
" }}}
" NerdTree start ---------------------- {{{
nmap <c-n> : NERDTreeToggle<CR>
" }}}
" Vim test --------------------- {{{
let test#custom_runners = {'typescript': ['deno']}
" }}}
