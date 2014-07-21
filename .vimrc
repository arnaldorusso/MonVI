execute pathogen#infect()
" hg clone https://vim.google.com/hg/ vim
" cd vim/src
" ./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/vim
" make && make install
" mkdir -p $HOME/bin
" cd $HOME/bin
" ln -s $HOME/opt/vim/bin/vim
" which vim
" vim --version
"" inide Debian we install this
"aptitude install gtk2-engines-pixbuf
"==========================================================================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

colors zenburn
syntax on

" Mouse and backspace(for erasure)
set mouse=a
set bs=2

set t_Co=256
filetype indent plugin on
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
set nowrap " don't automatically wrap on load
set fo-=t  " don't automatically wrap text when typing
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

" =============================================
" Python Setup
" =============================================
" Setup Pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim
" https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

" Now Plugins are installed directlly inside .vim/plugin/bundle/Nome_do_plugin
call pathogen#infect()

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" set laststatus=2

