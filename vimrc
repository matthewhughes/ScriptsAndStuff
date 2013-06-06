" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.
set nocompatible                  " Must come first because it changes other options.
filetype off

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.


set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=*.pyc,node_modules/**

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set nuw=3
set ruler                         " Show cursor position.
set autoindent

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set novisualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set list
set listchars=tab:▸\

colorscheme jellybeans


noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

nnoremap ; :
" nnoremap : ;

vnoremap ; :
" vnoremap : ;

if (&term =~ "xterm")
  set t_Co=256
elseif (&term =~ "screen")
  set t_Co=16
else
  set t_Co=8
endif

" Functions
function TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

function TrimTrailingWhitespaces()
  let save_cursor = getpos(".")
  :silent! %s#\s\+$##g
  call setpos('.', save_cursor)
endfunction

"Trim empty lines at the EOF
au BufWritePre * call TrimEndLines()
au BufWritePre * call TrimTrailingWhitespaces()

set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

noremap <C-H> :bp<CR>
noremap <C-L> :bn<CR>

let g:EasyMotion_leader_key = '<Space>'
nmap s <Space>w
nmap S <Space>b

let g:syntastic_error_symbol='✖'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol=':('
let g:syntastic_style_error_symbol=':('

let g:netrw_liststyle = 4

augroup syn_gutter
  au BufWinEnter * sign define mysign
  au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END
