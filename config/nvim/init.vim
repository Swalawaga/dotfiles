noh
"Some visual stuff
syntax on
set t_Co=16
set showmode
set showcmd
set ruler
set number
set nohlsearch
"set hidden
"set cursorline
set expandtab
set noshiftround
set lazyredraw
set magic
set hlsearch
set incsearch ignorecase smartcase modelines=0 cmdheight=1 scrolloff=8 list
set listchars=tab:\|\
set matchpairs+=<:>
set statusline=%1*\ file\ %3*\ %f\ %4*\ 
set statusline+=%=
set statusline+=%3*\ %l\ of\ %L\ %2*\ line\ 
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
"Keybinds
let mapleader="\<SPACE>"
nnoremap <leader>t :r !python3 ~/.config/nvim/test.py % <CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>f :browse oldfiles<CR>
nnoremap <leader>s :w<CR>

"Plugins

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'vifm/vifm.vim'
Plug 'zeekay/vim-beautify'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
"Plug 'ycm-core/YouCompleteMe'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

call plug#end()
syntax on

hi linenr ctermfg=8
hi cursorline cterm=NONE
hi cursorlinenr ctermfg=15
hi comment ctermfg=8
hi pmenu ctermbg=0 ctermfg=NONE
hi pmenusel ctermbg=4 ctermfg=0
hi pmenusbar ctermbg=0
hi pmenuthumb ctermbg=7
hi matchparen ctermbg=black ctermfg=NONE
hi search ctermbg=0
hi statusline ctermbg=0 ctermfg=NONE
hi statuslinenc ctermbg=0 ctermfg=0
hi user1 ctermbg=1 ctermfg=0
hi user2 ctermbg=4 ctermfg=0
hi user3 ctermbg=0 ctermfg=NONE
hi user4 ctermbg=NONE ctermfg=NONE
hi group1 ctermbg=NONE ctermfg=0
autocmd colorscheme * hi clear cursorline
match group1 /\t/
