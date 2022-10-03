set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot'
Plugin 'airblade/vim-gitgutter'
Plugin 'preservim/tagbar'
Plugin 'vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'dkprice/vim-easygrep'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'heavenshell/vim-pydocstring'
" Plugin 'dense-analysis/ale'
" Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'tpope/vim-markdown'
" Plugin 'klen/python-mode'
" Plugin 'ivanov/vim-ipython'
" Plugin 'vim-python/python-syntax'
" Plugin 'Valloric/YouCompleteMe'

" Themes
Plugin 'tomasr/molokai'
Plugin 'jnurmine/Zenburn'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sainnhe/sonokai'

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

"==========================================================================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Open NerdTree as folder oppened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"leave file in the last position
set hidden

" TermGuiColor Setup
if has('termguicolors')
    set termguicolors
endif
" colors Tomorrow-Night
" colors molokai
" colors zenburn
" colors PaperColor

let g:sonokai_style = 'default' "or use 'atlatis'
let g:sonokai_better_performance = 1
colors sonokai

syntax on

" Mouse and backspace(for erasure)
" set mouse=a
set mouse=vic
set bs=2

set t_Co=256
"filetype indent plugin on
syntax on
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set modeline
set shiftround

" Set font and size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=inconsolata\ 15
  elseif has("gui_photon")
    set guifont=inconsolata:s15
  elseif has("x11")
    set guifont=-*-inconsolata-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=inconsolata:h15:cDEFAULT
  endif
endif


" execute modifications while saving
autocmd! bufwritepost .vimrc source %

" better copy and paste
set pastetoggle=<F2>
set clipboard=unnamedplus


" Mouse and backspace(for erasure)
set mouse=a
set bs=2

" Save with Ctrl+B
noremap <C-B> :update<CR>
vnoremap <C-B> <C-C>:update<CR>
inoremap <C-B> <C-O>:update<CR>

" <ESC> key to jj
inoremap jj <ESC>
" <ESC> key to kk 
inoremap kk <ESC>
" Press i to enter insert mode, and ii to exit.
inoremap ii <ESC>
" Two semicolons are easy to type.
inoremap ;; <ESC>

" Move between tabs (created [:tabnew])
let mapleader=","
map <Leader>z <esc>:tabprevious<CR>
map <Leader>x <esc>:tabnext<CR>
map <Leader>q <esc>:tabclose<CR>
noremap <silent> <leader><space> :nohl<CR>
noremap <silent> <leader>n :NERDTreeToggle<CR>
noremap <silent> <leader>p :CtrlP<CR>
noremap <silent> <leader>t :CtrlPBuffer<CR>
noremap <silent> <leader>h :split<CR>
noremap <silent> <leader>v :vsplit<CR>
" DocString
noremap <silent> <leader>d :Pydocstring<CR>
let g:pydocstring_formatter = 'numpy'
let g:pydocstring_doq_path = '/home/arnaldo/Envs/otter/bin/doq'

" Ident block code
vnoremap < <gv
vnoremap > >gv

" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window

" Show line number and lenght
set number " Show line number
set tw=79  " widht of document
" set nowrap " don't automatically wrap on load
" set fo-=t  " don't automatically wrap text when typing
set wrap
set linebreak
set nolist
" set colorcolumn=80
" highlight ColorColumn ctermbg=233

" History
set history=700
set undolevels=700

" Make search insensitive
set hlsearch
set incsearch
set smartcase

" DIsable backup
set nobackup
set nowritebackup
set noswapfile

" NerdTree
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:airline#extensions#tabline#enabled = 1

" AG Search tool
let g:ag_working_path_mode="r"

" AsciiDoctor syntax
" wget https://raw.github.com/dagwieers/asciidoc-vim/master/syntax/asciidoc.vim
" download this synthax inside synthax folder of .vim directory
set syntax=asciidoc

" Markdown Unfold file
" let g:vim_markdown_folding_disabled=1
set nofoldenable

" line endings & other file chars settings
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,dos,mac
set binary

" Commentary for R language
autocmd FileType R,r setlocal commentstring=#\ %s

" Commentary for AsciiDoc language
autocmd FileType adoc,c,cpp,cs,java setlocal commentstring=//\ %s


" =============================================
" Python Setup
" =============================================
" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" set laststatus=2
let g:ycm_python_interpreter_path = '~/Envs/veg/bin/python3'
let g:ycm_python_sys_path = []

let python_highlight_all=1
syntax on

"" python with virtualenv support
" py << EOF
" import os
" import sys
" if 'Envs' in os.environ:
  " project_base_dir = os.environ['Envs']
  " activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  " execfile(activate_this, dict(__file__=activate_this))
" EOF

" disable arrows navigation
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"vim Customizations
"

let g:ctrlp_map = '<c-p>'  "CtrP shortcut
" let g:ackprg = "ag --nogroup --nocolor --column"

"Use Ack for search. Ex: :Ack string .py
" set ruler "shows line number of cursor

"" Disable the blinking cursor.
" set guicursor=
" set guicursor=n-v-c:blinkon0-block-Cursor/lCursor
" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul
" set guicursor-=a:blinkon0
" set scrolloff=3
autocmd InsertEnter,InsertLeave * set cul!

" TagBar config
nmap <F8> :TagbarToggle<CR>

" use c-j c-k in command mode
cmap <c-j> <down>
cmap <c-k> <up>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configurations                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Conqueror of Completion (COC)
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Ale Fix Plugin
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

" Close vim if the last tab is NerdTree
augroup bufclosetrack
  au!
  autocmd WinLeave * let g:lastWinName = @%
augroup END
function! LastWindow()
  exe "split " . g:lastWinName
endfunction
command -nargs=0 LastWindow call LastWindow()

" config NERDTree
noremap <silent> <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '\.db$', '\.sqlite$', '__pycache__', '.git', '.vagrant', '.DS_Store', '.idea', '.ropeproject']

" airline
" let g:airline_theme = 'sonokai'
let g:airline_theme = 'powerlineish'
" let g:airline_theme = 'tomorrow'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2

"" Vim airline with tabs
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" do not bell
set visualbell

" 
" let g:ackprg = 'ag --vimgrep'

" Python-mode
let g:pymode_lint = 0  " desabilita o plugin
let g:pymode_lint_on_write = 0 " desativa o checker ao salvar

" Map ,a to clean extra endline tabs/spaces
nnoremap <silent> ,a :%s,\s\+$,,<CR>


" Cuducos insertion of AsciiDoc function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Word processor mode                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd BufNewFile,BufRead *.adoc,*.tex call WordProcessor()
autocmd BufNewFile,BufRead *.adoc call WordProcessor()

function AsciiDocFold()
  let line = getline(v:lnum)
  if match(line, '^===') >= 0
    return ">2"
  elseif match(line, '^==') >= 0
    return ">1"
  endif
  return "="
endfunction

function AsciiDocFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

function WordProcessor()
  noremap <silent> <leader>f gwip
  if has("gui_macvim")
    set guifont=PT\ Mono:h14
  endif
  " colorscheme summerfruit256
  colorscheme Tomorrow
  syntax on
  set tw=90  " widht of document
  set wrap
  set linebreak
  set nolist
  " set formatoptions+=t
  setl fo=aw2tq
  " set textwidth=0
  " set wrapmargin=0
  set colorcolumn=90
  set spell spelllang=pt_br,en
  setlocal foldmethod=expr
  set syntax=asciidoc
  " setlocal foldexpr=AsciiDocFold()
  " setlocal foldtext=AsciiDocFoldText()
endfunction
