"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Functionality
set noswapfile
set nobackup
set nowrap

if has("termguicolors")
    set termguicolors  " Enable True Color support
endif

" VIM Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tomasr/molokai'
Plug 'preservim/nerdcommenter'
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
set splitbelow
set splitright

" Line Reference
set number
set relativenumber

" Proper Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Indentation
set smartindent

" Word Search and Highlight
set colorcolumn=80
set cursorline
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=#f92672
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Word Processor mode
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu
com! WordProcessor call WordProcessorMode()

" Mappings
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType javascript map <buffer> <F5> :w<CR>:exec '!node' shellescape(@%, 1)<CR>
autocmd FileType javascript imap <buffer> <F5> <esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>
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

" Auto closing Bracket and Quote (CTRL-V before, or Backspace after to bypass)
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap "<bs> "
inoremap '<bs> '
inoremap (<bs> (
inoremap [<bs> [
inoremap {<bs> {
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Wrap visual selection with quotations per line
vnoremap <leader>" :s/\%V\(.*\)\%V/"\1"/<CR>
vnoremap <leader>' :s/\%V\(.*\)\%V/'\1'/<CR>

" Commands
command Todo noautocmd vimgrep /TODO\|FIXME/j ** | cw
command IndentLines2 noautocmd setlocal ts=2 sts=2 sw=2 | IndentLinesReset
command IndentLines4 noautocmd setlocal ts=4 sts=4 sw=4 | IndentLinesReset

" Abbreviations
cabbrev vsf vert sfind

" File Type Settings
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""

set noshowmode  " Hide --INSERT-- mode. Airline show this instead

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

" ---------- NERDTree ----------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" ---------- TagBar ----------
nmap <leader>tt :TagbarToggle<CR>

" ---------- GitIgnore ----------
autocmd VimEnter * :WildignoreFromGitignore

" ---------- Fugitive ----------
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>

" -------- IndentLine ----------
let g:indentLine_char = '┊' " Samples: ▏ ┊ ┆ ¦

" ---------- Code Completion ----------
luafile ~/.config/nvim/lua/lsp_config.lua
luafile ~/.config/nvim/lua/nvim-cmp.lua
