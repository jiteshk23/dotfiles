set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" same shortcuts to move around vim windows and tmux panes
Plugin 'christoomey/vim-tmux-navigator'
" single and multiline comments
Plugin 'tpope/vim-commentary'
" git diff signs in gutter
Plugin 'airblade/vim-gitgutter'
" insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'

" code folding
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

" syntax check using syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_mode_map={'mode': 'passive'}
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args='--ignore=E501,E266,E722,E126,E131,E221,E241,E201,E202,E402'
let g:syntastic_cpp_check_header = 1
" run syntastic
nnoremap <silent> rr :SyntasticCheck<CR>
" reset syntastic
nnoremap <silent> RR :SyntasticReset<CR>
" toggle errors window
nnoremap <silent> xr :<C-u>call ToggleErrors()<CR>
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

let python_highlight_all=1
syntax on

" autocomplete
" Plugin 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = 'python'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" file manager
Plugin 'scrooloose/nerdtree'
" shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open a NERDTree automatically when vim starts up if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-unimpaired'
" Plugin 'tpope/vim-surround'
" Plugin 'python-mode/python-mode'
" Plugin 'kien/ctrlp.vim'

" clojure
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
let g:clojure_align_multiline_strings = 1
nnoremap <C-e> :Eval<CR>
nnoremap E :%Eval<CR>

" javascript and react
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set t_Co=256
colorscheme monokai
set encoding=utf-8

" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on ???
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" show line numbers
set number
set relativenumber " show relative line numbers"

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" With a map leader it's possible to do extra key combinations
let mapleader = "\\"
let g:mapleader = "\\"

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Always show the status line
set laststatus=2
set cmdheight=1

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" highlight extra whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" short message for some situations
set shortmess+=c

" use system clipboard
set clipboard=unnamed

" toggle paste mode
set pastetoggle=<leader>p

" better split positions
set splitbelow
set splitright

" enable folding
set foldmethod=indent
set foldlevel=60
" enable folding with the spacebar
nnoremap <space> za

" python and web full-stack indentations
au BufNewFile,BufRead *.py,*.json
            \ set tabstop=4 |
            \ set softtabstop=4 |
            \ set shiftwidth=4 |
            \ set textwidth=120 |
            \ set colorcolumn=120 |
            \ set expandtab |
            \ set smarttab |
            \ set autoindent |
            \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.cpp,*.h
            \ set tabstop=2 |
            \ set softtabstop=2 |
            \ set shiftwidth=2 |
            \ set expandtab |
            \ set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
" Insert ipdb breakpoint
map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>
map <silent> <leader>B oimport ipdb; ipdb.set_trace()<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

nnoremap <silent> <leader>l :set nonumber \| set norelativenumber<cr>
nnoremap <silent> <leader>L :set number \| set relativenumber<cr>

set tags=~/mytags
