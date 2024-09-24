" =============================================================
" vimrc for MS-Windows
" Maintainer:
"       Bruce Allen - @Blunc1999
"
" Thanks to amix/vimrc, giving me tons of ideas!
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"    -> vim-plug

" =============================================================

" =============================================================
" => General
" =============================================================

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype on
filetype indent on  "根据文件类型，加载缩进文件
filetype plugin on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set nocompatible

" =============================================================
" => VIM user interface
" =============================================================

" set menu language as en_US
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"set langmenu=zh_
"let $LANG = 'zh_CHS'

set wildmenu  "能够自动补全显示命令行语句，并可利用“tab”键进行相应的选择

" Ignore compiled files
set wildignore+=.git\*,.hg\*,.svn\*

" Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hidden

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

exec "nohlsearch"

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Add a bit extra margin to the left
set foldcolumn=1

set number
set relativenumber

set cursorline

set showcmd

" =============================================================
" => Colors and Fonts
" =============================================================

" Enable syntax highlighting
syntax enable  "set 'syntax on' to override default color scheme using syntax

" Set regular expression engine automatically
set regexpengine=0

"set colorscheme

let g:SnazzyTransparent = 1
try
    colorscheme snazzy
catch
endtry

set background=dark

" set encoding formats
set fencs=utf-8,gbk,gb2312,gb18030
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gb2312,ucs-bom,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos

" set fonts for vim
set guifont=IBM\ Plex\ Mono:h14,CaskaydiaCove\ Nerd\ Font:h12

" =============================================================
" => Files, backups and undo
" =============================================================

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

" =============================================================
" => Text, tab and indent related
" =============================================================

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"indent by 2 spaces when hitting tab
set softtabstop=2  

" Linebreak on 500 characters
set linebreak
set textwidth=500

set autoindent
set smartindent
set wrap "Wrap lines

" =============================================================
" => Visual mode related
" =============================================================

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" =============================================================
" => Moving around, tabs, windows and buffers
" =============================================================

" =============================================================
" => Status line
" =============================================================

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" =============================================================
" => Editing mappings
" =============================================================

" =============================================================
" => Spell checking
" =============================================================

" =============================================================
" => Misc
" =============================================================

set mouse=a
set clipboard=unnamedplus
set clipboard=unnamed
let &t_ut=''
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_si = "\<esc>]50;cursorshape=1\x7"
let &t_sr = "\<esc>]50;cursorshape=2\x7"
let &t_ei = "\<esc>]50;cursorshape=0\x7"
set autochdir
au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" =============================================================
" => Helper functions
" =============================================================

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" =============================================================
" => vim-plug
" =============================================================

call plug#begin('~/vimfiles/plugged')

Plug 'connorholyday/vim-snazzy'

Plug 'mileszs/ack.vim'

" Error checking
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rhysd/conflict-marker.vim'
Plug 'github/copilot.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'junegunn/goyo.vim' " distraction free writing mode

" Python
Plug 'vim-scripts/indentpython.vim'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" If you have nodejs
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" File navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'amix/open_file_under_cursor.vim'
Plug 'tpope/vim-pathogen'
Plug 'spf13/PIV'
Plug 'garbas/vim-snipmate'
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

Plug 'mbbill/undotree/'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'vim-airline/vim-airline'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-commentary'
Plug 'hail2u/vim-css3-syntax'
Plug 'itchyny/vim-cursorword'
Plug 'terryma/vim-expand-region'
" Plug 'fadein/FIGlet'
Plug 'tpope/vim-fugitive'
Plug 'gisphm/vim-gitignore'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'michaeljsmith/vim-indent-object'
Plug 'elzr/vim-json'
Plug 'mg979/vim-visual-multi'

" Bookmarks
Plug 'kshenoy/vim-signature'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mg979/vim-visual-multi'
Plug 'kana/vim-textobj-user'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'amix/vim-zenroom2'
Plug 'vimwiki/vimwiki'
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
" Plug 'Valloric/YouCompleteMe'

" modes
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'sophacles/vim-bundle-mako'
Plug 'preservim/vim-markdown'
Plug 'vim-scripts/nginx.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()


" iamcco/markdown-preview
" set to 1, nvim will open the preview window after entering the Markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, Vim will refresh Markdown when saving the buffer or
" when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be used for all files,
" by default it can be use in Markdown files only
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, the preview server is available to others in your network.
" By default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page.
" Useful when you work in remote Vim and preview on local browser.
" For more details see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = 'google-chrome-stable'

" set to 1, echo preview page URL in command line when opening preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom Vim function name to open preview page
" this function will receive URL as param
" default is empty
let g:mkdp_browserfunc = ''

" options for Markdown rendering
" mkit: markdown-it options for rendering
" katex: KaTeX options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: whether to disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: means the cursor position is always at the middle of the preview page
"   top: means the Vim top viewport always shows up at the top of the preview page
"   relative: means the cursor position is always at relative positon of the preview page
" hide_yaml_meta: whether to hide YAML metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom Markdown style. Must be an absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style. Must be an absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" use a custom location for images
" let g:mkdp_images_path = /home/user/.markdown_images

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is defined according to the preferences of the system
let g:mkdp_theme = 'dark'

" combine preview window
" default: 0
" if enable it will reuse previous opened preview window when you preview markdown file.
" ensure to set let g:mkdp_auto_close = 0 if you have enable this option
let g:mkdp_combine_preview = 0

" auto refetch combine preview contents when change markdown buffer
" only when g:mkdp_combine_preview is 1
let g:mkdp_combine_preview_auto_refresh = 1




