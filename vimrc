set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" vimproc
Bundle 'Shougo/vimproc.vim'

" change the mapleader from \ to ,
let mapleader=","

" command history
set history=8000

" change the terminal's title
set title

" auto-indent
set smartindent
set shiftround
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
filetype indent plugin on

" syntax highlighting
syntax on
Bundle 'scrooloose/syntastic'
let g:syntastic_c_compiler_options = '-std=gnu11'
let g:syntastic_cpp_compiler_options = '-std=gnu++14'
let g:syntastic_javascript_checkers = ['eslint']
Bundle 'jakar/vim-json'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'othree/yajs.vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'leafgarland/typescript-vim'
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1
Bundle 'Quramy/tsuquyomi'
let g:syntastic_typescript_checkers = ['tsuquyomi', 'eslint']
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mlr-msft/vim-loves-dafny'
let g:syntastic_dafny_checkers = ['dafny']
Bundle 'nunchaku-inria/vim-nunchaku'

" color theme
set t_Co=256
Bundle 'tpope/vim-vividchalk'
colorscheme vividchalk

" auto-update files that changed outside vim
set autoread

" jump to previous cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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

" <Ctrl-M> redraws the screen and removes any search highlighting.
nnoremap <C-M> :nohl<CR>:GhcModTypeClear<CR><C-L>

" n-ext result when search is automatically centered
map N Nzz
map n nzz

" enable spell checking and remove color column for .tex files
autocmd FileType tex setlocal spell cc=0

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWritePost * match ExtraWhitespace /\s\+$/
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
nnoremap <C-w> :QuitTab<CR>
command! QuitTab call s:QuitTab()
function! s:QuitTab()
  try
    tabclose
  catch /E784/ " Can't close last tab
    qall
  endtry
endfunction
nmap <C-t> :tabnew<CR>
imap <C-w> <Esc>:tabclose<CR>i
imap <C-t> <Esc>:tabnew<CR>
nmap <C-j> :tabp<CR>
nmap <C-k> :tabn<CR>
nmap <C-h> B
nmap <C-l> W
vmap <C-h> B
vmap <C-l> W
imap <C-h> <Esc>:tabp<CR>i
imap <C-l> <Esc>:tabn<CR>i
set showtabline=2
set switchbuf=usetab,newtab
nmap <C-o> :wincmd gf<CR>

" easy window navigation
nmap <tab> :wincmd w<CR>

" open current window as tab
nmap <C-p> :wincmd T<CR>

" file browser
Bundle 'git://git.wincent.com/command-t.git'
map <C-e> ,t
let g:CommandTAcceptSelectionMap=[]
let g:CommandTAcceptSelectionTabMap=['<CR>']

" The NERD Tree
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
nnoremap <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeMinimalUI=1
let NERDTreeMouseMode=3
let NERDTreeChDirMode=2
let g:nerdtree_tabs_open_on_gui_startup=0

" man pages
source $VIMRUNTIME/ftplugin/man.vim
nmap K :Man <cword><CR>:wincmd T<CR>
let $MANPAGER=''

" undo
set undolevels=100000
map <C-Z> u
map! <C-Z> <C-O>u

" save with ctrl+s
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>i

" embedded shell
Bundle 'lrvick/Conque-Shell'
nnoremap <C-b> :ConqueTermTab bash<CR>

" surround plugin
Bundle 'tpope/vim-surround'

" comment/uncomment lines
Bundle 'tpope/vim-commentary'

" tabularize
Bundle 'godlygeek/tabular'

" autocompletion
Bundle 'Shougo/neocomplete'
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType typescript set omnifunc=tsuquyomi#complete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
if has("gui_running")
  hi Pmenu     guibg=#686868
  hi PmenuSel  guibg=#B26818
  hi PmenuSbar guibg=#000000
else
  hi Pmenu     ctermbg=8
  hi PmenuSel  ctermbg=3
  hi PmenuSbar ctermbg=0
endif
Bundle 'marijnh/tern_for_vim'

" show vim filename in Konsole header
autocmd BufReadPost * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setTitle 1 %:p
autocmd VimLeavePre * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setTitle 1 $PWD

" haskell
Bundle 'ghcmod'
nnoremap T :GhcModType<CR>

"remove toolbar in gvim
set guioptions-=T
if has('gui_running')
  set guifont=Inconsolata\ Medium\ 10
endif

"support for editor config
Bundle 'editorconfig/editorconfig-vim'

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " No console pops up
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Some one-key macros
nnoremap <C-k1> @1
nnoremap <C-k2> @2
nnoremap <C-k3> @3
