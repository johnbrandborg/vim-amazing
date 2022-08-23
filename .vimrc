"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Functionality
set nocompatible | filetype indent plugin on | syn on
set noswapfile
set nobackup
set nowrap
set encoding=utf8
set autoread

if has("termguicolors")
    set termguicolors  " Enable True Color support
endif

" VIM Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" You Complete Me Build
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    " !./install.py --clangd-completer --rust-completer
    !./install.py
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'valloric/youcompleteme', {'do': function('BuildYCM')}
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'yggdroot/indentline'
Plug 'vim-scripts/gitignore'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'  " Use a patched Font. https://www.nerdfonts.com/
Plug 'hashivim/vim-terraform'
call plug#end()

" General
set mouse=a
set showcmd
set splitbelow
set splitright

" Line Reference
set number
set relativenumber

" Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Indentation
set autoindent
set smartindent
set cindent

" Find Files
set wildmenu
set path+=**

" Word Search and Highlight
set colorcolumn=80
set hlsearch
set incsearch
set cursorline
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#f92672
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Mappings
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
nnoremap <silent> ,<space> :nohlsearch<CR>
" Easy Window Switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Easy Window Resizing
nnoremap <M-UP> :resize +2<CR>
nnoremap <M-DOWN> :resize -2<CR>
nnoremap <M-LEFT> :vertical resize -2<CR>
nnoremap <M-RIGHT> :vertical resize +2<CR>

" Commands
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
command IndentLines2 noautocmd setlocal ts=2 sts=2 sw=2 | IndentLinesReset
command IndentLines4 noautocmd setlocal ts=4 sts=4 sw=4 | IndentLinesReset

" Abbreviations
cabbrev vsf vert sfind

" File Type Settings
"au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""

set noshowmode  " Lightline or Airline display mode

" ----------- Theme -----------
set t_Co=256
"let g:molokai_original = 1
colorscheme molokai

if has('terminal')
    let g:terminal_ansi_colors = [
        \ '#1F1F1F',
        \ '#F92672',
        \ '#A6E22E',
        \ '#E69F66',
        \ '#6699DF',
        \ '#FD5FF0',
        \ '#A1EFE4',
        \ '#75715E',
        \ '#3E3D32',
        \ '#F92672',
        \ '#A6E22E',
        \ '#E6DB74',
        \ '#66D9EF',
        \ '#FD5FF0',
        \ '#A1EFE4',
        \ '#F8F8F0'
    \ ]
endif

highlight Pmenu guibg=#232526 guifg=#F8F8F0
highlight PmenuSel guifg=#232526 guibg=#FD971F
highlight WildMenu cterm=bold gui=bold guibg=#FD971F guifg=#232526

" ----------- Airline -----------
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ---------- TagBar ----------
nmap <leader>tt :TagbarToggle<CR>

" ---------- NetRW ----------
let g:netrw_banner = 0
let g:netrw_listhide = netrw_gitignore#Hide()
let g:netrw_liststyle = 3

" ---------- YouCompleteMe ----------
nnoremap <leader>jd :YcmCompleter GoTo<CR>

" ---------- GitIgnore ----------
autocmd VimEnter * :WildignoreFromGitignore

" ---------- Fugitive ----------
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" -------- IndentLine ----------
let g:vim_json_conceal = 0  " vim 8.1.2060+ JSON file quote fix
