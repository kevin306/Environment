execute pathogen#infect()

" The rest of your config follows here

set nocompatible			" Turn off compatibility with old vi
set showcmd				" Show partial command in the last line of the screen
syntax enable
set colorcolumn=80
set number
set autoread
set history=500
set wildmenu
set wildmode=longest:full,full
set ruler				" Display the cursor position on the last line of the screen or in the status" line of a window
set tags=tags;/				" checks current folder for tags file and keeps going to root
set wildmenu				" Better command-line completion
set encoding=utf-8
set paste
set cursorline          		" highlight current line
set incsearch           		" search as characters are entered
set hlsearch            		" highlight matches
set showmatch				" show matching bracket (briefly jump)
set backspace=2
set mouse=a				" Allow mouse clicking

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" needed so that vim still understands escape sequences
nnoremap <esc>^[ <esc>^[

"*****Indentation*****
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"*****remapping*****
" Tagbar keybinding to F8
nmap <f8> :TagbarToggle<cr>
" NERDTree keybinding to F1
nmap <f9> :NERDTreeToggle<cr>
map <F5> :!cscope -b<CR>:cs reset<CR><CR>
vnoremap <C-c> "*y

"*****automatic commands*****
" Spell check highlight under curser easier colour
highlight SpellBad ctermfg=000
autocmd BufWritePre * 	:%s/\s\+$//e 					" Remove trailing white spaces on save
autocmd FileType * match Error /\s\+$/ 					" Highlight trailing white spaces
autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>\"|$
au BufRead,BufNewFile *.c setlocal textwidth=80 			" Wrap to 80 chars
au BufRead,BufNewFile *.h setlocal textwidth=80 			" Wrap to 80 chars
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType .rst setlocal spell

"*****git*****
autocmd FileType gitcommit setlocal spell
autocmd Filetype gitcommit setlocal colorcolumn=72

"*****python*****
au BufRead,BufNewFile *.py setlocal textwidth=80 			" Wrap to 80 chars
autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd BufWritePre *.py !autopep8 -i expand("%")<CR>
if has("autocmd")
    autocmd FileType python set complete+=k/home/kevin/.vim/rkulla-pydiction-41c7143/pydiction isk+=.,(
endif " has("autocmd"
