set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jnurmine/Zenburn'
" Plugin 'klen/python-mode'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
" Plugin 'tpope/vim-repeat'
"Plugin 'sjl/gundo.vim'
"Plugin 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/syntastic'
" Plugin 'wincent/Command-T'
" Plugin 'DamienCassou/textlint'
" Plugin 'vim-scripts/genutils'
" Plugin 'vim-scripts/foldutil.vim'
Bundle 'ivanov/vim-ipython'
"Plugin 'altercation/vim-colors-solarized'

Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
" Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'rodnaph/vim-color-schemes'
Plugin 'sheerun/vim-polyglot'

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

colors zenburn
syntax on

" Mouse and backspace(for erasure)
set mouse=a
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
    set guifont=inconsolata\ 14
  elseif has("gui_photon")
    set guifont=inconsolata:s14
  elseif has("x11")
    set guifont=-*-inconsolata-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=inconsolata:h14:cDEFAULT
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

" Move between tabs (created [:tabnew])
let mapleader=","
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

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
set colorcolumn=80
highlight ColorColumn ctermbg=233

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

" AsciiDoctor syntax
" wget https://raw.github.com/dagwieers/asciidoc-vim/master/syntax/asciidoc.vim
" download this synthax inside synthax folder of .vim directory
set syntax=asciidoc

" =============================================
" Python Setup
" =============================================
" Setup Pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim
" https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

" Now Plugins are installed directlly inside .vim/plugin/bundle/Nome_do_plugin
" call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" set laststatus=2

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
"Clear search highlight
let g:ctrlp_map = '<c-p>'  "CtrP shortcut
let g:ackprg = "ag --nogroup --nocolor --column"
"Use Ack for search. Ex: :Ack string .py
