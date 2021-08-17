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

"normal tabs and spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
