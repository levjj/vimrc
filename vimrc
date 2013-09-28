set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

nnoremap ; :

" change the mapleader from \ to ,
let mapleader=","

" command history
set history=800

" change the terminal's title
set title

" auto-indent
set shiftround
set shiftwidth=2
set tabstop=2
set expandtab
filetype indent plugin on

" syntax highlighting
syntax on
Bundle 'jakar/vim-json'
Bundle 'kchmck/vim-coffee-script'

" color theme
set t_Co=256
Bundle 'tpope/vim-vividchalk'
colorscheme vividchalk

" auto-update files that changed outside vim
set autoread

" auto-completing for commands
set wildmenu
set wildmode=list:longest,full
set showcmd

" incremental search with highlighting
set hlsearch
set incsearch

" make backspace work over lines
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set nostartofline

" folding
set foldmethod=indent
set foldlevel=999

" space will toggle folds!
nnoremap <space> za

" show the line and column number
set ruler

" confirm when in conflict
set confirm

" no 'bell'
set visualbell
set t_vb=

" line numbers
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" make Y behave like the other capitals
map Y y$

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <C-L> :nohl<CR><C-L>

" n-ext result when search is automatically centered
map N Nzz
map n nzz

" enable spell checking and remove color column for .tex files
autocmd FileType tex setlocal spell cc=0

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" write file as sudo
cmap w!! %!sudo tee > /dev/null %

" better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Set the command window height to 2 lines, to avoid many cases of having to 'press <Enter> to continue'
set cmdheight=1

" status line
set laststatus=2

" show matching parenthesis
set showmatch

" encoding
set encoding=utf-8

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-L> :nohl<CR><C-L>

" mouse support
set mouse=a

" static line break indicator
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=233 guibg=#121212
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" copy and paste
set clipboard=unnamedplus
set pastetoggle=<F11>

" no backup files
set nobackup
set noswapfile

" powerline
Bundle 'Lokaltog/vim-powerline'

" git support
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
highlight clear SignColumn

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" tabs
nmap <C-w> :tabclose<CR>
nmap <C-t> :tabnew<CR>
imap <C-w> <Esc>:tabclose<CR>i
imap <C-t> <Esc>:tabnew<CR>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>
imap <C-h> <Esc>:tabp<CR>i
imap <C-l> <Esc>:tabn<CR>i

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" file browser
Bundle 'git://git.wincent.com/command-t.git'

" undo
set undolevels=800
map <C-Z> u
map! <C-Z> <C-O>u

" show vim filename in Konsole header
autocmd BufReadPost * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setTitle 1 %:p
autocmd VimLeavePre * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setTitle 1 $PWD
