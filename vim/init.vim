let mapleader = ','
let maplocalleader = '//'

"minpac start------------ {{{
packadd minpac
call minpac#init()

call minpac#add('kristijanhusak/vim-hybrid-material')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'}) 
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
call minpac#add('preservim/tagbar')
call minpac#add('neoclide/jsonc.vim')
call minpac#add('voldikss/vim-floaterm')
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('puremourning/vimspector')
call minpac#add('szw/vim-maximizer')
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('folke/todo-comments.nvim')

call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
" }}}

"theme start------------- {{{
"set background=dark
"colorscheme hybrid_material
colorscheme nord
"}}}

"Fuzzy search start------------- {{{
nnoremap <C-p> :<C-u>FZF<CR>
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS='--reverse'

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
command! -bang Ideas call fzf#vim#files('~/ideas', <bang>0)
command! -bar -bang Maps call fzf#vim#maps("n", <bang>0)
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
nnoremap <leader>t<up> :tabr<cr>
nnoremap <leader>t<down> :tabl<cr>
nnoremap <leader>t<left> :tabp<cr>
nnoremap <leader>t<right> :tabn<cr>
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
" navigate tabs
nnoremap <c-l> :tabnext<cr>
inoremap <c-l> <esc>:tabnext<cr>i
nnoremap <c-h> :tabprevious<cr>
inoremap <c-h> <esc>:tabprevious<cr>i

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
set nowritebackup
set updatetime=300
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
" json --------- {{{
augroup filetype_json
  autocmd!
  autocmd Filetype json setlocal filetype=jsonc
  "autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc
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
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
"Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Format all buffer
nnoremap <leader><c-F> :Format<cr>
inoremap <leader><c-F> <esc>:Format<cr>i
nnoremap <leader><c-O> :OR<cr>
inoremap <leader><c-O> <esc>:OR<cr>i
"Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}
" tagbar -------------------{{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
let g:tagbar_type_typescript = {
\ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
"}}}
" FloatTerm -----------------{{{
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
" }}}
" Vim inspector --------------{{{
" for normal mode - the word under the cursor
nnoremap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xnoremap <Leader>di <Plug>VimspectorBalloonEval
" }}}
" Maximizer ------------------ {{{
let g:maximizer_set_default_mapping = 1
let g:maximizer_default_mapping_key = '<F3>'
" }}}
