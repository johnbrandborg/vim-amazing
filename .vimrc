""""""""""""""""""""""""""""""""""""" 
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Functionality
set nocompatible | filetype indent plugin on | syn on
set noswapfile
set nobackup
set nowrap
set encoding=utf8

if has("termguicolors") && $COLORTERM == 'truecolor'
    set termguicolors " Enable True Color support
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
    !./install.py --clangd-completer --rust-completer
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim' " Airline alternative
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

" Mappings
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>
nnoremap <silent> ,<space> :nohlsearch<CR>

" Commands
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw

" Abbreviations
cabbrev vsf vert sfind

" File Type Settings
"au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""

set noshowmode " Lightline or Airline display mode

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
let g:airline_powerline_fonts = 1 " Disable if not available

" ---------- Lightline ---------- 
set laststatus=2 " Lightline needs this generally
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filepath', 'modified' ] ]
    \   },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \   'filepath': 'FilePath'
    \   },
    \ }
function! FilePath()
    return fnamemodify(expand("%"), ":~:.")
endfunction

" ---------- TagBar ---------- 
nmap <leader>tt :TagbarToggle<CR>

" ---------- NetRW ----------  
let g:netrw_banner = 0
let g:netrw_listhide=netrw_gitignore#Hide()
let g:netrw_liststyle = 3

" ---------- Syntastic ----------
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1 " Not for everyone
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" The following can be used if you don't want to use YCM
"let g:syntastic_c_checkers = ['gcc', 'make', 'splint']
"let g:syntastic_python_checkers = ['pep8', 'pycodestyle', 'pylint', 'python']

" ---------- YouCompleteMe ----------
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_clangd_uses_ycmd_caching = 0
nnoremap <leader>yg :YcmCompleter GoTo<CR>

" ---------- GitIgnore ---------- 
autocmd VimEnter * :WildignoreFromGitignore

" ---------- Fugitive ---------- 
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
