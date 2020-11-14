let mapleader = ','
let maplocalleader = '//'

"minpac start------------ {{{
packadd minpac
call minpac#init()

call minpac#add('kristijanhusak/vim-hybrid-material')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'}) 
call minpac#add('junegunn/fzf')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('mhinz/vim-grepper')
call minpac#add('janko-m/vim-test')
call minpac#add('preservim/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('tpope/vim-obsession')
call minpac#add('sgur/vim-editorconfig')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('mattn/emmet-vim')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-fugitive')
call minpac#add('udalov/kotlin-vim')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('tpope/vim-eunuch')
call minpac#add('aserebryakov/vim-todo-lists')
call minpac#add('cespare/vim-toml')
call minpac#add('peitalin/vim-jsx-typescript')
call minpac#add('mbbill/undotree')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('tpope/vim-commentary')
call minpac#add('vim-airline/vim-airline')

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
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS='--reverse'
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
"upper case and lower case the word under cursor
inoremap <c-u> <esc>viwUi
inoremap <c-l> <esc>viwui
" back in normal mode
inoremap jk <esc>
" edit and source config file
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
" surround with single and double quote
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <Leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <Leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <Leader>" <esc>`<i"<esc>`>a"<esc>
" search selection
vnoremap <c-r> "0y:%s/<c-r>0//gc<left><left><left>
" tab navigation
nnoremap <c-t><up> :tabr<cr>
nnoremap <c-t><down> :tabl<cr>
nnoremap <c-t><left> :tabp<cr>
nnoremap <c-t><right> :tabn<cr>
" switch back to normal mode from terminal mode
tnoremap <esc> <c-\><c-n>
" quickfix navigation
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]Q :clast<cr>

nnoremap <leader>ghw :h <C-R>=expand('<cword>')<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ghw :h <C-R>=expand('<cword>')<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Copy paste from clipboard registry
nnoremap <Leader>cc "+gP
vnoremap <Leader>cv "+y
vnoremap <Leader>cx "+x
" duplicate line
nnoremap <c-d> yyp
" save all
nnoremap <c-s> :wa<cr>
inoremap <c-s> <esc>:wa<cr>i
"}}}

"Common start----------- {{{
syntax on
set title
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set cmdheight=2
set updatetime=50
set shortmess+=c
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
" }}}
" c, start -----------------{{{
augroup filetype_c
  autocmd!
  autocmd Filetype c set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
augroup END
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
nmap <leader><c-n> : NERDTreeToggle<CR>
" }}}
" Vim test --------------------- {{{
let test#custom_runners = {'typescript': ['deno']}
" }}}
" Prevent netest nvim instances ---- {{{
if executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
" }}}
" Fugitive plugin ------ {{{
augroup fugitive
  autocmd!
  autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' nnoremap <buffer> .. :edit %:h<cr>
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" }}}
" Coc config ---------------{{{
set statusline^=%{coc#status()}

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><nowait> <space>j :<c-u>CocNext<CR>
nnoremap <silent><nowait> <space>k :<c-u>CocPrev<CR>
"use c-space start completition
inoremap <silent><expr> <c-space> coc#refresh()
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" }}}
